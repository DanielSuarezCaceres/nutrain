class Food < ApplicationRecord
  belongs_to :meal, inverse_of: :foods
end
