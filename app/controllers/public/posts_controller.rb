class Public::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  #createはcontroller/public/stadiumsに記述

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @stadium = @post.stadium
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @stadium = @post.stadium
  end

  def update
    @post = Post.find(params[:id])
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
      end
    end
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @stadium = @post.stadium
    @post.destroy
    redirect_to stadium_path(@stadium)
  end

  private


  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to post_path(@post) unless @user == current_user
  end

  def post_params
    params.require(:post).permit(:stadium_id, :title, :caption, images: [])
  end

end
