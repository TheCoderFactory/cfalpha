class AddDiscountToCourseBooking < ActiveRecord::Migration
  def change
    add_column :course_bookings, :discount, :decimal
  end
end
