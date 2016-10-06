class Manufacturer < ActiveRecord::Base
  validates_formatting_of :base_url, using: :url
  acts_as_votable 
end
