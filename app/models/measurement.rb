class Measurement < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1, message: "must be one at least"}
end
