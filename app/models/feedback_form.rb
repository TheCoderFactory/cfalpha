class FeedbackForm < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_location

  def self.this_week
  	where('created_at > ?', Date.today - 7.days)
  end

  def rating
  	(expectations + recommend + another + satisfaction + value) / 5
  end
end
