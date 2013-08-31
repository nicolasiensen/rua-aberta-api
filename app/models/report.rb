class Report < ActiveRecord::Base
  attr_accessible :path_id, :rating, :user_id
  validates :path_id, :rating, :user_id
end
