class Public::StadiumsController < ApplicationController


  def index
    @q = Stadium.ransack(params[:q])
    @stadiums = @q.result
  end

  def show
    @stadium = Stadium.find(params[:id])
    @post = Post.new
    @q = @stadium.posts.ransack(params[:q])
    @posts = @q.result
  end

end
