class Event < ApplicationRecord
  # Ideally: a user_template that also belongs_to template
  belongs_to :user
  has_many :certificates, dependent: :destroy

  # move to templates model or controller
  CERTIFICATE_TEMPLATES = %i[language_certificate tech_hackathon employment_certificate]

  validates :name, presence: true
  validates :description, presence: true
  validates :certificate_template, presence: true
  validates :organization_name, presence: true
  validates :website_url, presence: true
  validates :logo_url, presence: true
end
