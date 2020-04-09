class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy, inverse_of: :workout
  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :number_of_exercises, numericality: { minimum: 1 }
end
