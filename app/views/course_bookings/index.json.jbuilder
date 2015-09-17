json.array!(@course_bookings) do |course_booking|
  json.extract! course_booking, :id, :course_intake_id, :user_id, :price, :promo_code, :paid, :completed
  json.url course_booking_url(course_booking, format: :json)
end
