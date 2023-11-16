class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @post = Post.where(id: @posts.pluck(:id)).take
    @recent_comment = @post.recent_comments if @post
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @name = @user.name if @user
    @text = @post.text
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.where(post_id: @posts.pluck(:id))
  end
end
