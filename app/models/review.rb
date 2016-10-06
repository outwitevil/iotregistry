class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :iotdevice
  acts_as_votable 
end
