class AddReferrerToPrequestionnaire < ActiveRecord::Migration
  def change
    add_column :prequestionnaires, :referrer, :string
  end
end
