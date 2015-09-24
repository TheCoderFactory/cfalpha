class ReminderMailer < ApplicationMailer
  default from: "Coder Factory Reminders <info@coderfactory.com>"

  def reminder(course_intake, user)
    @course_intake = CourseIntake.find(course_intake)
    @course = @course_intake.course
    @user = User.find(user)
    mail(to: @user.email, subject: @user.first_name + ", " + @course.name + " is starting soon.")
  end
end
