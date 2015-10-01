class CourseType < ActiveRecord::Base
	has_many :courses, dependent: :restrict_with_exception

	extend FriendlyId
  friendly_id :name, use: :slugged
end
