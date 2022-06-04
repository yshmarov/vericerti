class CertificateTemplatesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_certificate
  before_action :set_responce_format

  def classic; end

  def modern; end

  def language_certificate; end

  private

  def set_certificate
    @user = User.new
    @event = @user.events.new
    @certificate = @event.certificates.new
  end

  def set_responce_format
    respond_to do |format|
      format.html
      format.xlsx do
        @title = action_name
        render xlsx: action_name, template: "#{controller_name}/#{action_name}"
      end
      format.pdf do
        render pdf: [controller_name, action_name].join('-'),
               #  a template variant could be introduced here
               #  template: 'layouts/classic',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end
end
