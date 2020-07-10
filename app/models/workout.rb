class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy
  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :day, presence: true
  # validates :description, presence: true, length: { minium: 30 }
  #validates :number_of_exercises, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}

  def name_and_date
    "#{name} | Date: #{day}"
  end

  def get_all_exercises
    all_exercises = []
    exercises.each do |exercise|
      all_exercises << exercise
    end
    all_exercises
  end

end
