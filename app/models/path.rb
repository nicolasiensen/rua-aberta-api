class Path < ActiveRecord::Base
  attr_accessible :parking, :lat_a, :lat_b, :lng_a, :lng_b
  validates :lat_a, :lng_a, :lat_b, :lng_b, presence: true
end
