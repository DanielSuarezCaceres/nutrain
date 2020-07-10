class Contract < ApplicationRecord
  belongs_to :client
  belongs_to :professional

  validates :client_id, presence: true
  validates :professional_id, presence: true
  validates :message, presence: true
  
  def self.get_contract_message(client_id, professional_id)
    contract = Contract.where(client_id: client_id, professional_id: professional_id).first
    if contract.state == 'Active'
      "See contract"
    else
      "See contract request"
    end
  end

  def self.get_state(client_id, professional_id)
    contract = Contract.where(client_id: client_id, professional_id: professional_id).first
    contract.state
  end

end
