# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => 'user_avatar'

  def public_id
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def filename
    "avatar.png" if original_filename
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end