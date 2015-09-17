class Course < ActiveRecord::Base
  belongs_to :course_type
  has_many :course_intakes
  has_many :course_skills
  has_many :skills, through: :course_skills

  extend FriendlyId
  friendly_id :name, use: :slugged
end
