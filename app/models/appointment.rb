class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :professional
  attr_accessible :start_time
  attr_accessible :end_time

  def start_time=(start_time)
    @start_time = start_time
  end

  def end_time=(end_time)
    @end_time = end_time
  end

end
