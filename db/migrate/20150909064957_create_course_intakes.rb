class CreateCourseIntakes < ActiveRecord::Migration
  def change
    create_table :course_intakes do |t|
      t.references :course, index: true, foreign_key: true
      t.references :course_location, index: true, foreign_key: true
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :days_of_week, array: true
      t.string :status
      t.decimal :price
      t.string :slug

      t.timestamps null: false
    end
  end
end
