class CreatePrequestionnaires < ActiveRecord::Migration
  def change
    create_table :prequestionnaires do |t|
      t.references :course_booking, index: true, foreign_key: true
      t.string :reason
      t.string :background
      t.string :experience
      t.string :hobbies

      t.timestamps null: false
    end
  end
end
