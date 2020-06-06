class Exercise < ApplicationRecord
  belongs_to :workout
  validates :name, presence: true
  # validates :sets, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
  # validates :reps, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}

  def full_description
    "#{name} , #{sets} sets, #{reps} reps, #{weight} kg"
  end

end
