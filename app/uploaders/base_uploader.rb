# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Abstract class that uploaders inherit from.
class BaseUploader < CarrierWave::Uploader::Base
  # Custom method so we can set the uploaders filename from seed data.
  #
  # @param value [String] the value to set.
  def filename=(value)
    @filename = value
  end
end