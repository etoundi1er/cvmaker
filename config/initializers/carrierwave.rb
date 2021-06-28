require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region:                ENV['AWS_REGION']
    }
    config.fog_directory = ENV['AWS_S3_BUCKET']

    # config.cache_dir     = Rails.root.join('tmp', 'uploads') # for heroku, if you want to use cached versions

    # For testing, upload files to local 'tmp' folder.
    if Rails.env.test?
        config.storage = :file
        config.enable_processing = false
        config.root = Rails.root.join('tmp')
    else
        config.storage = :fog
    end
end
