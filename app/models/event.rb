class Event < ApplicationRecord
  belongs_to :user
  has_many :certificates, dependent: :destroy

  CERTIFICATE_TEMPLATES = %i[classic modern language_certificate]

  validates :name, presence: true
  validates :description, presence: true
  validates :certificate_template, presence: true

  require 'csv'

  def import(file_params)
    return if file_params.nil?

    File.open(file_params) do |file|
      # CSV.foreach(file, headers: true) do |row|
      #   certificates.create(row.to_h)
      # end

      CSV.foreach(file, headers: true) do |row|
        # row.headers
        # row.fields
        # binding.b
        # subreddit_hash = row.to_hash
        formatted_row = row.fields.join(';').split(';')
        name = formatted_row.first
        email = formatted_row.second
        description = formatted_row.third
        certificates.create(name:, email:, description:)
      end
      #   # subreddit_hash['Name'] = row[0].to_s # Name bug`s
      #   # row['Tags'] ||= ' - '
      #   # subreddit_hash['Tags'] = row['Tags'].split(',').map { |t| t.gsub(%r{ / }, '/') }
      #   # row['Related Subreddits By Users'] ||= ' - '
      #   # subreddit_hash['Related Subreddits By Users'] = row['Related Subreddits By Users']
      #   CsvImportService.new.import(self, subreddit_hash)
      # end
    end
  end
end
