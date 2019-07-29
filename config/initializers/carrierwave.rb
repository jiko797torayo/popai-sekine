CarrierWave.configure do |config|
  if Rails.env.eql? 'production'
    config.fog_credentials = {
      provider:              ENV['FOG_PROVIDER'],
      aws_access_key_id:     ENV['AWS_ACCEWSS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                ENV['FOG_REGION']
    }

    config.fog_directory  = 'popaisekine'
    config.cache_storage  = :fog
    config.asset_host = ENV['ASSET_HOST']
  end
end
