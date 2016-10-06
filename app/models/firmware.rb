class Firmware < ActiveRecord::Base
  belongs_to :iotdevice
  validates_formatting_of :download_url, using: :url
end
