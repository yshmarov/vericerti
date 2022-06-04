class CertificatesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :set_certificate, only: %i[show edit update destroy]

  def index
    @certificates = Certificate.all
  end

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

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to certificate_url(@certificate), notice: 'Certificate was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_certificate
    @certificate = Certificate.find(params[:id])
  end

  def certificate_params
    params.require(:certificate).permit(:event_id, :name, :email, :description)
  end
end
