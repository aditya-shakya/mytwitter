class Follower < ActiveRecord::Base
  validates :follower_id,  :presence => true
  validates :following_id, :presence => true

  belongs_to :user,  foreign_key: "follower_id"
  belongs_to :user,  foreign_key: "following_id"

end
