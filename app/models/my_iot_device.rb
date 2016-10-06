class MyIotDevice < ActiveRecord::Base
  belongs_to :iotdevice
  belongs_to :user
  validates_formatting_of :ipv4_address, using: :ip_address_v4
end
