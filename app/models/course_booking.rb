class CourseBooking < ActiveRecord::Base
  belongs_to :course_intake
  belongs_to :user

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end


end
