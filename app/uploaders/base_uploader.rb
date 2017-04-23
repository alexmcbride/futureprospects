# Abstract class that uploaders inherit from.
class BaseUploader < CarrierWave::Uploader::Base
  # Custom method so we can set the uploaders filename from seed data.
  #
  # * +value+ - the value to set.
  def filename=(value)
    @filename = value
  end
end