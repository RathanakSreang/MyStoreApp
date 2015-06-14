# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # "uploads/#{model.class.to_s.underscore}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path("fallback/" + [version_name,
                                          "user_profile.jpg"].compact.join('_'))
  
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  process convert: "jpg"
  process resize_to_fill: [200, 200, "Center"]

  version :small do
    #process resize_to_fit: [35, 35]
    process resize_to_fill: [35, 35, "Center"]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "user_profile.jpg" if original_filename
  end
end
