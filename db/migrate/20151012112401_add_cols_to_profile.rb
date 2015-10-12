class AddColsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :text
    add_column :profiles, :google_plus, :string
    add_column :profiles, :website, :string
  end
end
