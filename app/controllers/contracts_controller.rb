class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @contracts = pagy(User.find(current_user.id).contracts)
  end

  def show
  end

  def new
    # byebug
    @contract = Contract.new
    if current_user.type == 'Professional'
      if params[:client_id]
        # prepopulate client_id field in form
        @contract = current_user.contracts.build(client_id: params[:client_id])
      else
        @contract = Contract.new
      end
    elsif current_user.type == 'Client'
      if params[:professional_id]
        # prepopulate professional_id field in form
        @contract = current_user.contracts.build(professional_id: params[:professional_id])
      else
        @contract = Contract.new
      end
    else
      @contract = Contract.new
    end
  end
  
  def create
    @contract = current_user.contracts.new(contract_params)
    if @contract.valid?
      @contract.save
      redirect_to user_contracts_path(current_user), notice: 'Contract created successfully'
    else
      redirect_to new_user_contract_path(user_id: current_user.id),
        :flash => { :error => "Could not create contract due to following reasons: #{@contract.errors.full_messages}" }
    end
  end

  def update
    # If contract param is 'Accepted', save contract ; else, show it as reject or cancelled
    state = params[:contract][:state]
    if state == 'Accepted'
      if @contract.update(contract_params)
        @contract.update(state: 'Active')
        redirect_to user_contracts_path(current_user), notice: 'Contract accepted'
      else
        redirect_to edit_user_contract_path(current_user),
        :flash => { :error => "Could not edit contract due to following reasons: #{@contract.errors.full_messages}" }
      end
    else
      @contract.destroy
      # if contract was still pending, show as rejected ; else, show as existing contract deleted
      state == 'Rejected' ? notice_message = 'Contract request rejected successfully' : notice_message = 'Contract deleted successfully'
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
      redirect_to user_contracts_path(current_user), flash => { :error => "Something went wrong while deleting contract" }
    end
  end

  def delete_all
    if current_user.contracts.delete_all
      redirect_to user_contracts_path(current_user), notice: 'All contracts deleted successfully'
    else
      redirect_to user_contracts_path(current_user),
      :flash => { :error => "Something went wrong while deleting contracts" }
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
