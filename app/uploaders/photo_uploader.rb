class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [1000, 1000]

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  unless Rails.env.test?
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg)
  end

  unless Rails.env.test?
    def filename
      "#{secure_token}.#{file.extension}" if original_filename.present?
    end
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
