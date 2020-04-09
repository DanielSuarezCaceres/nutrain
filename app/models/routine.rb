class Routine < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :days_of_exercise, presence: true, numericality: { minimum: 1 }
  validates :goal, presence: true
end
