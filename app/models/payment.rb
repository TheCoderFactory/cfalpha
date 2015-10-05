class Payment < ActiveRecord::Base
  belongs_to :course_booking
  has_paper_trail
end
