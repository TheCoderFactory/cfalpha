class ChangeSurveyFields < ActiveRecord::Migration
  def change
  	remove_column :survey_forms, :skills, :string
  	remove_column :survey_forms, :company, :string
  	remove_column :survey_forms, :comments, :string
  	add_column :survey_forms, :skills, :text
  	add_column :survey_forms, :company, :text
  	add_column :survey_forms, :comments, :text
  end
end
