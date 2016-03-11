class AddDownloadOptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :download_option, :string
  end
end
