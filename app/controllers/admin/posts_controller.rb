class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @stadium = @post.stadium
    @user = @post.user
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
