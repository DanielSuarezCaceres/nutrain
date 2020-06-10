class Diet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  # validates :description, presence: true, length: { minimum: 30 }
  validates :kcal_goal, presence: true, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
  validates :recommended_meals, presence: true, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
  validates :goal, presence: true

  before_save :check_active_diet
  # attr_reader :kcal_goal

  # If any diet is saved as 'active', set other active diets to 'false' (only one can be active)
  def check_active_diet
    if self.active
      Diet.where.not(id: self.id).update_all(active: false)
    end
  end

end
