class Certificate < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :email, presence: true
  # description

  has_one_attached :qr_code

  after_create :generate_qr
  def generate_qr
    GenerateQr.call(self)
  end
end
