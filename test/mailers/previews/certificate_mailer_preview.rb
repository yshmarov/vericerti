# Preview all emails at http://localhost:3000/rails/mailers/certificate_mailer
class CertificateMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/certificate_mailer/certificate
  def certificate
    CertificateMailer.with(certificate: Certificate.first).certificate
  end
end
