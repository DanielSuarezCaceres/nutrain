class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :professional

  def start_time
    self.start_date
  end

  def end_date
    self.end_date
  end

end
