class CreateCourseSkills < ActiveRecord::Migration
  def change
    create_table :course_skills do |t|
      t.references :course, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
