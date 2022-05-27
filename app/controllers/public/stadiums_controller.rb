class Public::StadiumsController < ApplicationController


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

end
