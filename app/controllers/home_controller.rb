class HomeController < ApplicationController
  # require 'Tweet'
  def index
    if(current_user)
      @user = User.find_by_id(current_user.id)
      @myfollowing = Follower.joins("JOIN users where users.id = followers.following_id AND followers.follower_id =" + current_user.id.to_s ).select("email, follower_id, following_id , followers.id")
      @visible = @myfollowing.pluck(:following_id)
      @visible += [current_user.id]
      @tweets = Tweet.where( user_id: @visible).order("created_at DESC")
      # @tweets = Tweet.all
      end
  end
end
