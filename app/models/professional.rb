class Professional < User
  has_many :contracts
  has_many :appointments

  def current_clients
  end

  def not_clients
    all = Client.all
    current_clients = []
    self.contracts.each do |contract|
      current_clients << User.find(contract.client_id)
    end
    clients = all - current_clients
    clients
  end

end