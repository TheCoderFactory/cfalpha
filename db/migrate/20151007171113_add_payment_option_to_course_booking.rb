class AddPaymentOptionToCourseBooking < ActiveRecord::Migration
  def change
    add_column :course_bookings, :payment_option, :string
  end
end
