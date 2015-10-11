class BookingMailer < ApplicationMailer
  default from: "Coder Factory Bookings <info@coderfactory.com>"
  
  def received(booking_id)
    @booking = CourseBooking.find(booking_id)
    @intake = @booking.course_intake
    @course = @intake.course
    mail(to: "info@coderfactory.com", subject: "Coder Factory Booking Received")
  end

  def response(booking_id)
    @booking = CourseBooking.find(booking_id)
    @intake = @booking.course_intake
    @course = @intake.course
    @user = @booking.user
    mail(to: @user.email, subject: @user.first_name + ", your Coder Factory booking has been received")
  end
end
