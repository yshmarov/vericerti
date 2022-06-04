class GenerateQr < ApplicationService
  attr_reader :certificate

  def initialize(certificate)
    @certificate = certificate
  end

  # url_for helper
  include Rails.application.routes.url_helpers

  # ensure rqrcode works here
  require 'rqrcode'

  def call
    # https://vericerti.com/certificates/5.pdf
    qr_url = url_for(controller: 'certificates',
                     action: 'show',
                     id: "#{certificate.id}.pdf",
                     host: 'vericerti.com',
                     only_path: false)

    # generate QR code
    qr_code = RQRCode::QRCode.new(qr_url)

    # QR code to image
    qr_png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    # name the image
    image_name = SecureRandom.hex

    # save the image in TMP
    image = IO.binwrite("tmp/storage/#{image_name}.png", qr_png.to_s)

    # save TMP file to ActiveStorage
    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open("tmp/storage/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    # attach ActiveStorage::Blob to the certificate
    certificate.qr_code.attach(blob)
  end
end
