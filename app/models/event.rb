class Event < ApplicationRecord
  belongs_to :user
  has_many :certificates

  CERTIFICATE_TEMPLATES = %i[classic modern language_certificate]

  validates :name, presence: true
  validates :description, presence: true
  validates :certificate_template, presence: true
end
