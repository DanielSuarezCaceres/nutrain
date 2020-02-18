class Meal < ApplicationRecord
  belongs_to :user
  has_many :foods
  accepts_nested_attributes_for :foods, allow_destroy: true
end
