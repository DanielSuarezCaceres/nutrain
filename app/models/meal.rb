class Meal < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods, reject_if: :all_blank, allow_destroy: true
end
