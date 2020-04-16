class Client < User
  has_many :contracts
  has_many :appointments

  def current_professionals
    
  end
end