class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @bio = @user.bio
    @recent_post = @user.recent_posts
  end
end
