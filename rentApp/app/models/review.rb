class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  acts_as_votable
end
