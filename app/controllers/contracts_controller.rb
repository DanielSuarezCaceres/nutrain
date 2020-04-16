class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = User.find(params[:user_id]).contracts
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    #byebug
    @contract = Contract.new
  end
  
  def create
    #byebug
    # esta asignacion no deberia tener que hacerla, buscar solucion
    # params[:user_id] = current_user.id
    #@user = User.find(params[:user_id])
    @contract = current_user.contracts.new(contract_params)
    #byebug
    if @contract.valid?
      @contract.save
      flash[:notice] = 'Contract created sucessfully'
      redirect_to user_contracts_path(current_user)
    else
      flash[:error] = @contract.errors.full_messages
      render :new
    end
  end

  def update
    #@contract = Contract.find(params[:id])
    #byebug
    if @contract.update(contract_params)
      flash[:notice] = 'Contract updated succesfully'
      redirect_to user_contract_path(user_id: current_user.id)
    else
      flash[:error] = @contract.errors.full_messages
      render :edit
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def destroy
    if @contract.destroy
      redirect_to root_path, notice: 'Contract deleted successfully'
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

end
