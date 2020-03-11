class Exercise < ApplicationRecord
  belongs_to :workout, inverse_of: :exercises
end
