class Tweet < ActiveRecord::Base
  # validates :user_id, :presence => true
  validates :name,  :presence => true
  validates :content, :presence => true,
            :length => { :maximum => 140 }
  has_one :User
end
