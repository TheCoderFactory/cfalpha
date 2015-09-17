class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.references :course, index: true, foreign_key: true
      t.references :course_location, index: true, foreign_key: true
      t.integer :expectations
      t.integer :recommend
      t.integer :another
      t.integer :satisfaction
      t.integer :value
      t.text :best_part
      t.text :comments
      t.text :testimonial

      t.timestamps null: false
    end
  end
end
