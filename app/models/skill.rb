class Skill < ActiveRecord::Base
  belongs_to :skill_category
  has_many :course_skills
  has_many :courses, through: :course_skills
end
