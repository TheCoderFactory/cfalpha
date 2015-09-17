class Prequestionnaire < ActiveRecord::Base
  belongs_to :course_booking

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end
end
