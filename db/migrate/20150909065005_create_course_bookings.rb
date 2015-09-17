class CreateCourseBookings < ActiveRecord::Migration
  def change
    create_table :course_bookings do |t|
      t.references :course_intake, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :price
      t.string :promo_code
      t.boolean :paid
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
