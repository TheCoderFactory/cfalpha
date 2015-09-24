require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "response" do
    mail = WelcomeMailer.response
    assert_equal "Response", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
