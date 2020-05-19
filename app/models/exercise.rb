class Exercise < ApplicationRecord
  belongs_to :workout, inverse_of: :exercises

  def full_description
    "#{name} , #{sets} sets, #{reps} reps, #{weight} kg"
  end

end
