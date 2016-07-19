class Property < ActiveRecord::Base
  belongs_to :user

  # def self.search(search)
  #   where("streetaddress LIKE ?", "%#{search}%")
  #   where("city LIKE ?", "%#{search}%")
  # end



  geocoded_by :streetaddress
  after_validation :geocode
end
