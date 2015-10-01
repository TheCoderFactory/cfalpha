class CourseLocation < ActiveRecord::Base
	has_many :course_intakes, dependent: :restrict_with_exception

	extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :full_street_address
  after_validation :geocode

  def street_address
  	[name, address_one, address_two, suburb].compact.join(', ')
  end

  def full_street_address
  	[name, address_one, address_two, suburb, state, postcode, country].compact.join(', ')
  end
end
