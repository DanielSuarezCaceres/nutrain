class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = User.find(params[:user_id]).contracts
  end

  def show
  end

  def new
    #byebug
    # @contract = Contract.new
    # prepopulate client_id field in form
    #if params[:client_id]
    # byebug
    if current_user.type == 'Professional'
      if params[:client_id]
        @contract = current_user.contracts.build(client_id: params[:client_id])
      else
        @contract = Contract.new
      end
    elsif current_user.type == 'Client'
      if params[:professional_id]
        @contract = current_user.contracts.build(professional_id: params[:professional_id])
      else
        @contract = Contract.new
      end
    else
      @contract = Contract.new
    end
  end
  
  def create
    # esta asignacion no deberia tener que hacerla, buscar solucion
    # params[:user_id] = current_user.id
    #@user = User.find(params[:user_id])
    @contract = current_user.contracts.new(contract_params)
    # byebug
    # byebug
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
    #byebug
    if state == 'Accepted'
      #byebug
      if @contract.update(contract_params)
        @contract.update(state: 'Active')
        redirect_to user_contracts_path(current_user), notice: 'Contract accepted'
      else
        flash[:error] = @contract.errors.full_messages
        render :edit
      end
    else
      @contract.destroy
      # if contract was still pending, show as rejected ; else, show as existing contract deleted
      state == 'Rejected' ? notice_message = 'Contract request rejected' : notice_message = 'Contract cancelled'
      redirect_to user_contracts_path(current_user), notice: notice_message
    end
  end

  def edit
  end

  def destroy
    state = @contract.state
    if @contract.destroy
      state == 'Pending' ? notice_message = 'Contract request cancelled' : notice_message = 'Contract deleted successfully'
      redirect_to user_contracts_path(current_user), notice: notice_message
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
      :message,
      :sent_by_id,
      :start_date
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
