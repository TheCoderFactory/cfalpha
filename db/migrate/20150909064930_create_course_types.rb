class CreateCourseTypes < ActiveRecord::Migration
  def change
    create_table :course_types do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :slug

      t.timestamps null: false
    end
  end
end
