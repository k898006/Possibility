class Admin::PostsController < ApplicationController

  before_action :correct_user

  def index
    @posts = Post.all.page(params[:page]).order(created_at: "DESC")
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

  def correct_user
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end
end
