class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy, inverse_of: :workout
  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true
end
