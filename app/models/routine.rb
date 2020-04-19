class Routine < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, uniqueness: true
  validates :days_of_exercise, presence: true, numericality: { minimum: 1 }
  validates :goal, presence: true

  before_save :check_active_routine

  # If any routine is saved as 'active', set other active routines to 'false' (only one can be active)
  def check_active_routine
    if self.active
      Routine.where.not(id: self.id).update_all(active: false)
    end
  end
end
