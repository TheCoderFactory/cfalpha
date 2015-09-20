class AddColsToCourseBooking < ActiveRecord::Migration
  def change
    add_column :course_bookings, :guid, :string
    add_index :course_bookings, :guid, unique: true
    add_column :course_bookings, :gst, :decimal
  end
end
