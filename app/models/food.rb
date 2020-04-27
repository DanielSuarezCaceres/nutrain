class Food < ApplicationRecord
  #belongs_to :meal, inverse_of: :foods
  has_many :dishes, inverse_of: :food
  has_many :meals, through: :dishes

  def name_and_amount
    "#{name} , #{serving_size} g, #{brand}"
  end

end
