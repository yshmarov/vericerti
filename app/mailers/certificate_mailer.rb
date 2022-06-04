class CertificateMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.certificate_mailer.certificate.subject
  #
  def certificate
    @certificate = params[:certificate]
    # @greeting = 'Hi'

    mail to: 'to@example.org',
         subject: 'a new certificate'
  end
end
