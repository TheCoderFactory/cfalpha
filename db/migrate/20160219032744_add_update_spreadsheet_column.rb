class AddUpdateSpreadsheetColumn < ActiveRecord::Migration
  def change
    add_column :enquiries, :in_spreadsheet, :boolean, default: false
    add_column :course_bookings, :in_spreadsheet, :boolean, default: false
  end
end
