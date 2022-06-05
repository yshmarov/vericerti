class CsvImportService
  require 'csv'

  # event has many certificates
  # csv contains rows of certificates
  # name;email;description
  def import(event, file_params)
    File.open(file_params) do |file|
      # CSV.foreach(file, headers: true) do |row|
      #   certificates.create(row.to_h)
      # end

      CSV.foreach(file, headers: true) do |row|
        # row.headers
        # row.fields
        # binding.b
        # subreddit_hash = row.to_hash

        # get objects of row
        formatted_row = row.fields.join(';').split(';')
        name = formatted_row.first
        email = formatted_row.second
        description = formatted_row.third

        # create child based on above parsed data
        certificate = event.certificates.create(name:, email:, description:)
        # send email
        CertificateMailer.with(certificate:).certificate.deliver_later
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

  # def import(event, subreddit_hash)
  #   event.certificates.find_or_create_by!(
  #     name: subreddit_hash['name'],
  #     email: subreddit_hash['email'],
  #     description: subreddit_hash['description']
  #   )
  # end
end
