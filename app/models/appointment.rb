class Appointment < ApplicationRecord
  default_scope { order("created_at DESC") }

  belongs_to :client
  belongs_to :professional
  
  validates :title, presence: true
  validates :start_time, presence: true
  validates :client_id, presence: true
  validates :professional_id, presence: true
  validate :start_time, :start_time_is_valid
  # validates :start_time_is_valid_datetime
  # validates :end_time_is_valid_datetime

  def start_time_is_valid
    if !start_time.nil?
      if start_time < Date.today
        errors.add(:start_time, 'must be equal or later than today')
      end
      if start_time.strftime("%Y").length > 4
        errors.add(:start_time, 'year is not correct')
      end
    end
  end

  # def start_time_is_valid_datetime
  #   errors.add(:start_time, 'start time must be a valid datetime') if ((DateTime.parse(start_time) rescue ArgumentError) == ArgumentError)
  # end

  # def end_time_is_valid_datetime
  #   errors.add(:end_time, 'end time must be valid datetime') if ((DateTime.parse(end_time) rescue ArgumentError) == ArgumentError)
  # end

  #def start_time=(start_time)
  #  @start_time = start_time
  #end
#
  #def end_time=(end_time)
  #  @end_time = end_time
  #end

end
