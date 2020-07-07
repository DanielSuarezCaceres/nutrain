class Professional < User
  has_many :contracts
  has_many :appointments

  def current_clients_list
    current_clients = []
    self.contracts.each do |contract|
      current_clients << User.find(contract.client_id)
    end
    current_clients
  end

  # Return list of clients that has no contract with this professional 
  def clients_without_contract
    all = Client.all
    current_clients = current_clients_list
    not_clients = all - current_clients
    not_clients
  end

  # Check if professional has a contract with client passed by param
  def has_contract?(user_id)
    result = false
    self.contracts.each do |contract|
      if contract.client_id == user_id
        result = true
      end
    end
    result
  end

  def is_nutritionist?
    self.nutritionist ? 'Yes' : 'No'
  end

  def is_trainer?
    self.trainer ? 'Yes' : 'No'
  end

  def is_physiotherapist?
    self.physiotherapist ? 'Yes' : 'No'
  end

  def is_psychologist?
    self.psychologist ? 'Yes' : 'No'
  end

  def verified?
    self.verified ? 'Yes' : 'No'
  end

end