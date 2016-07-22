# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => 'post_cover'
  
  def public_id
    "ibrmaranata/uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end
  
#  def filename
#    "cover.png" if original_filename
#  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
