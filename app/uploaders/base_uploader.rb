class BaseUploader < CarrierWave::Uploader::Base
  # So we can set the filename in the DB from seed data.
  def filename=(value)
    @filename = value
  end
end