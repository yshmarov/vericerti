class Certificate < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :email, presence: true
  # description
end
