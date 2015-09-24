class AddReminderSentToCourseBooking < ActiveRecord::Migration
  def change
    add_column :course_bookings, :reminder_send, :boolean, default: false
  end
end
