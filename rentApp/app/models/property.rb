class Property < ActiveRecord::Base
  has_many :reviews

  def self.search(search)
    where("streetaddress LIKE ?", "%#{search}%")
    where("city LIKE ?", "%#{search}%")
  end
end
