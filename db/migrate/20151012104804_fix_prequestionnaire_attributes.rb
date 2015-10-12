class FixPrequestionnaireAttributes < ActiveRecord::Migration
  def change
  	remove_column :prequestionnaires, :reason, :string
  	add_column :prequestionnaires, :reason, :text
  	remove_column :prequestionnaires, :background, :string
  	add_column :prequestionnaires, :background, :text
  	remove_column :prequestionnaires, :experience, :string
  	add_column :prequestionnaires, :experience, :text
  	remove_column :prequestionnaires, :hobbies, :string
  	add_column :prequestionnaires, :hobbies, :text
  end
end
