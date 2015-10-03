class Prequestionnaire < ActiveRecord::Base
  belongs_to :course_booking

  def self.this_week
  	where('created_at > ?', Date.today - 7.days)
  end
end
