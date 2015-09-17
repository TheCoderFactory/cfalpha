class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :course_type, index: true, foreign_key: true
      t.string :name
      t.string :tagline
      t.text :description
      t.boolean :active
      t.string :slug

      t.timestamps null: false
    end
  end
end
