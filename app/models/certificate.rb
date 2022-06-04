class Certificate < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :email, presence: true
  # description

  has_one_attached :qr_code

  extend FriendlyId
  friendly_id :random_hex, use: %i[finders slugged]

  def random_hex
    SecureRandom.hex
  end

  after_create :generate_qr

  def generate_qr
    GenerateQr.call(self)
  end
end
