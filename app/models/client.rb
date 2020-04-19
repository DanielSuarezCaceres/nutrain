class Client < User
  has_many :contracts
  has_many :appointments

  def current_professionals_list
    current_professionals = []
    self.contracts.each do |contract|
      current_professionals << User.find(contract.professional_id)
    end
    current_professionals
  end

  # Return list of professional that has no contract with this client
  def professionals_without_contract
    all = Professional.all
    current_professionals = current_professionals_list
    not_my_professionals = all - current_professionals
    not_my_professionals
  end

  # Check if has contract with professional passed by param
  def has_contract?(user_id)
    result = false
    self.contracts.each do |contract|
      if contract.professional_id == user_id
        result = true
      end
    end
    result
  end

end