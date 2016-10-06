class Iotdevice < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :user
  has_many :reviews
  has_one :device_category
end
