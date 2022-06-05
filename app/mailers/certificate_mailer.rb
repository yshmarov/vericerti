class CertificateMailer < ApplicationMailer
  def certificate
    @certificate = params[:certificate]

    mail to: @certificate.email,
         subject: "#{@certificate.event.name} certificate",
         cc: @certificate.event.user.email
  end
end
