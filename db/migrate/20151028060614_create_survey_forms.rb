class CreateSurveyForms < ActiveRecord::Migration
  def change
    create_table :survey_forms do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :industry
      t.string :skills
      t.string :company
      t.string :comments

      t.timestamps null: false
    end
  end
end
