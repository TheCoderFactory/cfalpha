require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  test "reminder" do
    mail = ReminderMailer.reminder
    assert_equal "Reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify" do
    mail = ReminderMailer.notify
    assert_equal "Notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
