class UploaderBase < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  process convert: 'jpg'

  version :small do
    process resize_to_fit: [100, 100]
  end

  version :thumb do
    process resize_to_fit: [400, 200]
  end

  version :large do
    process resize_to_fit: [600, nil]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[png jpg jpeg]
  end

  def filename
    "#{secure_token}.jpg" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
