class Professional < User
  has_many :contracts
  has_many :appointments

  def current_clients
  end

end