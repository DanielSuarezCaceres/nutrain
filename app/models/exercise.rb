class Exercise < ApplicationRecord
  belongs_to :workout
  validates :name, presence: true
  validates :sets, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
  validates :reps, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
  #validates :workout_id, presence: true

  def full_description
    "#{name} , #{sets} sets, #{reps} reps, #{weight} kg"
  end

  def self.user_exercises(user_id)
    exercises = []
    workouts = User.find(user_id).workouts
    workouts.each do |w|
      w.exercises.each do |e|
        exercises << e
      end
    end
    exercises
  end

end
