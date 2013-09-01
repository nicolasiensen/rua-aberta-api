class Obstacle < ActiveRecord::Base
  attr_accessible :lat, :lng, :category
  validates :lat, :lng, :category, presence: true
end
