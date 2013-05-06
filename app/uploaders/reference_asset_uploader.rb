# encoding: utf-8

class ReferenceAssetUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  version :large do
    process :resize_to_limit => [730, nil]
  end

  version :small do
    process :resize_to_limit => [330, nil]
  end

  def store_dir
    "uploads/reference_assets/reference_image/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
