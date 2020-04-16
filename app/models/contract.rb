class Contract < ApplicationRecord
  belongs_to :client
  belongs_to :professional
end
