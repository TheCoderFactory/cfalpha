# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailer/reminder
  def reminder
    ReminderMailer.reminder
  end

  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailer/notify
  def notify
    ReminderMailer.notify
  end

end
