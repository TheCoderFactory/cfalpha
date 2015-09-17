class CourseType < ActiveRecord::Base
	has_many :courses

	extend FriendlyId
  friendly_id :name, use: :slugged
end
