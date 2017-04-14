# Configuration for Amazon S3 should be made available through an Environment variable.
# For local installations, export the env variable through the shell OR
# if using Passenger, set an Apache environment variable.
#
# In Heroku, follow http://devcenter.heroku.com/articles/config-vars
#
# $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder


CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
      region:                ENV['AWS_REGION']                  # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['AWS_BUCKET']                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
