class Diet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :kcal_goal, presence: true
  validates :total_meals, presence: true, numericality: { minimum: 1 }
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
