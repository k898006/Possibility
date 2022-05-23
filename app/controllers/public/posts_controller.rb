class Public::PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]


  def new
    @post = Post.new
    @clubs = Club.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:post][:club_confirmed].present? && params[:post][:club_confirmed] == "true"
      @stadium = Stadium.find(params[:post][:stadium_id])
      @post.stadium_id = @stadium.id
      if @post.save
        redirect_to posts_path
      else
      render :new
      end
    else
      @stadiums = Stadium.where(club_id: params[:post][:club_id])
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    #画像の個別削除
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
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:club_id, :stadium_id, :title, :caption, :club_confirmed, images: [])
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end
end
