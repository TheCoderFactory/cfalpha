class ReminderMailer < ApplicationMailer
  default from: "Coder Factory Reminders <enquiries@coderfactory.com>"

  def reminder(course_intake_id, user_id)
    @intake = CourseIntake.find(course_intake_id)
    @course = @intake.course
    @user = User.find(user_id)
    mail(to: @user.email, subject: @user.first_name + ", " + @course.name + " is starting soon.")
  end
end
