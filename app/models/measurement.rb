class Measurement < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}

  def self.last_six_months(user_id)
    User.find(user_id).measurements.where('day BETWEEN ? AND ?', (Date.today - 6.month), Date.today)
  end

end
