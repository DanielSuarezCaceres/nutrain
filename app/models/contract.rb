class Contract < ApplicationRecord
  belongs_to :client
  belongs_to :professional
  
  def self.get_contract_message(client_id, professional_id)
    contract = Contract.where(client_id: client_id, professional_id: professional_id).first
    if contract.state == 'Active'
      "Cancel contract"
    else
      "Cancel contract request"
    end

    
  end

end
