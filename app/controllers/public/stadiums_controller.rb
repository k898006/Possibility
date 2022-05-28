class Public::StadiumsController < ApplicationController

  def create
    @stadium = Stadium.find(params[:post][:stadium_id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.stadium_id = @stadium.id
    if @post.save
      redirect_to stadium_path(@stadium)
    else
      @q = @stadium.posts.ransack(params[:q])
      @posts = @q.result.page(params[:page])
      render template:  "public/stadiums/show"
    end
  end

  def index
    @q = Stadium.ransack(params[:q])
    @stadiums = @q.result.page(params[:page])
  end

  def show
    @stadium = Stadium.find(params[:id])
    @post = Post.new
    @q = @stadium.posts.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:stadium_id, :title, :caption, :image)
  end


end
