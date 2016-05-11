class ReminderMailerJob
  include SuckerPunch::Job
  # include FistOfFury::Recurrent

  def perform(course_intake_id)
    @course_intake = CourseIntake.find(course_intake_id)
    @course_bookings = @course_intake.course_bookings
    # for each booking, send reminder email to user
    @course_bookings.each do |course_booking|
      # unless a reminder has already been sent for this booking
      if !course_booking.reminder_send && course_booking.paid
        ReminderMailer.reminder(course_intake_id, course_booking.user.id).deliver_now
        # update reminder_send attribute to true
        course_booking.update_attributes(reminder_send: true)
      end
      if !course_booking.reminder_send && course_booking.price == 0
        ReminderMailer.reminder(course_intake_id, course_booking.user.id).deliver_now
        # update reminder_send attribute to true
        course_booking.update_attributes(reminder_send: true)
      end
    end
    # raise NotImplementedError
  end
end
