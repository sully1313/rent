class Property < ActiveRecord::Base
  belongs_to :user
  has_many :reviews



  geocoded_by :streetaddress
  after_validation :geocode
end
