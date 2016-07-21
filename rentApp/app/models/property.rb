class Property < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy



  geocoded_by :streetaddress
  after_validation :geocode
end
