class CertificateTemplatesController < ApplicationController
  skip_before_action :authenticate_user!

  def classic
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'hello-filename',
               #  template: 'layouts/classic',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

  def modern; end
end
