class Contract < ApplicationRecord
  belongs_to :client
  belongs_to :professional

  validates :client_id, presence: true
  validates :professional_id, presence: true
  validates :message, presence: true
  
  def self.get_contract_message(first_id, second_id)
    if User.find(second_id).type == 'Professional'
      contract = Contract.where(client_id: first_id, professional_id: second_id).first
    else
      contract = Contract.where(client_id: second_id, professional_id: first_id).first
    end
    if contract.state == 'Active'
      "See contract"
    else
      "See contract request"
    end
  end

  def self.get_state(first_id, second_id)
    if User.find(second_id).type == 'Professional'
      contract = Contract.where(client_id: first_id, professional_id: second_id).first
    else
      contract = Contract.where(client_id: second_id, professional_id: first_id).first
    end
    contract.state
  end

end
