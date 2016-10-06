class MyIotDevice < ActiveRecord::Base
  belongs_to :iotdevice
  belongs_to :user
end
