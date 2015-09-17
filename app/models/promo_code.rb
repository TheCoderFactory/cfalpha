class PromoCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_intake
end
