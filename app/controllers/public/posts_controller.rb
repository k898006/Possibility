class Public::PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]


  def create
    @stadium = Stadium.find(params[:post][:stadium_id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to stadium_path(@stadium)
    else
      redirect_to stadium_path(@stadium)
    end
  end

  def index
    @posts = Post.all
  end

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
    @stadium = @post.stadium
    @post.destroy
    redirect_to stadium_path(@stadium)
  end

  #def search
    #@stadium = Stadium.find(params[:stadium_id])
    #@results = @q.result
  #end

  private

  def set_q
    @stadium = Stadium.find(params[:stadium_id])
    @q = @stadium.posts.ransack(params[:q])
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end

  def post_params
    params.require(:post).permit(:stadium_id, :title, :caption, images: [ ])
  end

end
