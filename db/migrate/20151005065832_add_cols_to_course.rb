class AddColsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :audience, :text
    add_column :courses, :prerequisites, :text
    add_column :courses, :outcomes, :text
    add_column :courses, :format, :text
    add_column :courses, :modules, :text
    add_column :courses, :payment, :text
    add_column :courses, :homework, :text
    add_column :courses, :assessments, :text
  end
end
