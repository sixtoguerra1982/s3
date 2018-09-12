CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider: 'AWS',                        # required
      aws_access_key_id: ENV['S3_ACCESS_KEY'],                        # required unless using use_iam_profile
      aws_secret_access_key: ENV['S3_SECRET_KEY'],                        # required unless using use_iam_profile
    }
    config.fog_directory  = ENV['S3_BUCKET']                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.storage = :fog
  end
end
