class CertificatesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_certificate

  def show
    respond_to do |format|
      format.html
      format.pdf do
        # wrapper pdf.html, inside - template-specific stuff
        render pdf: [@certificate.id, @certificate.name].join('-'),
               template: "certificate_templates/#{@certificate.event.certificate_template}",
               # template: 'certificate_templates/classic',
               #  template: 'layouts/classic',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

  private

  def set_certificate
    @certificate = current_user.certificates.find(params[:id])
  end
end
