class Iotdevice < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :user, through: :my_iot_device
  has_many :reviews
  has_one :device_category
  has_many :firmwares
  validates_formatting_of :product_url, using: :url
  validates_formatting_of :updates_url, using: :url
  acts_as_votable 
end
