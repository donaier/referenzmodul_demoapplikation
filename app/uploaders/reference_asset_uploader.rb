# encoding: utf-8

class ReferenceAssetUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  version :big do
    process :resize_to_fill => [400, 200] #todo definieren
  end

  version :small do
    process :resize_to_fill => [200, 100] #todo definieren
  end

  def store_dir
    "uploads/reference_assets/reference_image/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
