class Event < ApplicationRecord
  belongs_to :user

  CERTIFICATE_TEMPLATES = [:classic, :modern]

  validates :name, presence: true
  validates :description, presence: true
  validates :certificate_template, presence: true
end
