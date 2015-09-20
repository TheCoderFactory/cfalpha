class Course < ActiveRecord::Base
  belongs_to :course_type
  has_many :course_intakes
  has_many :course_skills
  has_many :skills, through: :course_skills

  extend FriendlyId
  friendly_id :name, use: :slugged


  def self.get_courses_by_type(course_type_name)
  	course_type = CourseType.find_by(name: course_type_name)
  	alphabetical.where(course_type_id: course_type.id)
  end

  def self.alphabetical
  	order(name: :asc)
  end

end
