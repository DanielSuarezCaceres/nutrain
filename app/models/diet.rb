class Diet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :kcal_goal, presence: true
  validates :total_meals, presence: true, numericality: { minimum: 1 }
end
