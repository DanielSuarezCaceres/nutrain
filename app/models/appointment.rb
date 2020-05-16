class Appointment < ApplicationRecord
  default_scope { order("created_at DESC") }

  belongs_to :client
  belongs_to :professional
  
  validates :title, presence: true
  #validates :description, presence: true, lenght: { minimum: 3 }
  # validates :start_time_is_valid_datetime
  # validates :end_time_is_valid_datetime

  def start_time_is_valid_datetime
    errors.add(:start_time, 'start time must be a valid datetime') if ((DateTime.parse(start_time) rescue ArgumentError) == ArgumentError)
  end

  def end_time_is_valid_datetime
    errors.add(:end_time, 'end time must be valid datetime') if ((DateTime.parse(end_time) rescue ArgumentError) == ArgumentError)
  end

  #def start_time=(start_time)
  #  @start_time = start_time
  #end
#
  #def end_time=(end_time)
  #  @end_time = end_time
  #end

end
