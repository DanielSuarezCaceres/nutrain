class Professional < User
  has_many :contractual_relationships
  has_many :appointments

  def current_clients
  end

end