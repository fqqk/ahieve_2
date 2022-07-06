require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "sendmail_user" do
    mail = ContactMailer.sendmail_user
    assert_equal "Sendmail user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
