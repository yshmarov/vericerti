require "test_helper"

class CertificateMailerTest < ActionMailer::TestCase
  test "certificate" do
    mail = CertificateMailer.certificate
    assert_equal "Certificate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
