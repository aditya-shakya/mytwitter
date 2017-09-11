class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @followers = Follower.all
    @myfollower = @followers.joins("JOIN users where users.id = followers.follower_id AND followers.following_id =" + current_user.id.to_s ).select("username")
    @myfollowing = @followers.joins("JOIN users where users.id = followers.following_id AND followers.follower_id =" + current_user.id.to_s ).select("username, follower_id, following_id , followers.id")
    # puts(@myfollowing.inspect)
    @except =@myfollowing.pluck(:following_id) + [current_user.id]
    puts ( "here " + @except.to_s)
    @notfollowing = User.where.not(id: @except)
  end
  def add

  end
  def follow
      @follow = Follower.new
      @follow.follower_id = current_user.id
      @follow.following_id = params[:following_id]
      @follow.save
      respond_to do |format|
        format.html { redirect_to profile_index_path, notice: 'unfollow was successfully done.' }
        format.json { head :no_content }
      end

  end
  def unfollow
    @follow = Follower.find(params[:id])
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to profile_index_path, notice: 'unfollow was successfully done.' }
      format.json { head :no_content }
    end
  end
end
