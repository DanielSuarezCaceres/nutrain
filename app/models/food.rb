class Food < ApplicationRecord
  belongs_to :meal, inverse_of: :foods

  def name_and_amount
    "#{name} , #{serving_size} g"
  end
end
