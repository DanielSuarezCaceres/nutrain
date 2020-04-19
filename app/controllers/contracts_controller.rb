class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = User.find(params[:user_id]).contracts
  end

  def show
  end

  def new
    #byebug
    @contract = Contract.new
  end
  
  def create
    # esta asignacion no deberia tener que hacerla, buscar solucion
    # params[:user_id] = current_user.id
    #@user = User.find(params[:user_id])
    @contract = current_user.contracts.new(contract_params)
    byebug
    if @contract.valid?
      @contract.save
      flash[:notice] = "Contract request sent sucessfully"
      redirect_to user_contracts_path(current_user)
    else
      flash[:error] = @contract.errors.full_messages
      render :new
    end
  end

  def update
    # If contract param is 'Accepted', save contract ; else, show it as reject or cancelled
    state = params[:contract][:state]
    byebug
    if state == 'Accepted'
      byebug
      if @contract.update(contract_params)
        @contract.update(state: 'Active')
        redirect_to user_contracts_path(current_user), notice: 'Contract accepted'
      else
        flash[:error] = @contract.errors.full_messages
        render :edit
      end
    else
      @contract.destroy
      state == 'Rejected' ? notice_message = 'Contract request rejected' : notice_message = 'Contract cancelled'
      redirect_to user_contracts_path(current_user), notice: notice_message
    end
  end

  def edit
  end

  def destroy
    if @contract.destroy
      redirect_to user_contracts_path(current_user), notice: 'Contract deleted successfully'
    else
      flash[:notice] = @contract.errors.full_messages
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(
      :id,
      :client_id,
      :professional_id,
      :state,
      :start_date,
      :end_date
    )
  end

  def solve_contract_status
    if params[:contract][:state] == 'Accepted'
      if @contract.update(contract_params)
        @contract.update(state: 'Active')
      end
    end
  end

end
