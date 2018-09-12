require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
    # Credenciales de aws-s3
    if Rails.env.development? || Rails.env.test?
     config.storage    = :file
    else
     config.storage    = :fog
    end
    config.fog_provider = 'fog/aws'           # required
    config.fog_credentials = {
      provider: 'AWS',                        # required
      region: ENV.fetch('AWS_REGION'),
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),# required unless using use_iam_profile
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')# required unless using use_iam_profile
    }
    config.fog_directory  = ENV.fetch('S3_BUCKET_NAME')# required
    config.fog_public     = false                # optional, defaults to true
end
