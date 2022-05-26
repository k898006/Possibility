class Public::StadiumsController < ApplicationController

  #before_action :set_q, only: [:show, :search]

  def index
    @stadiums = Stadium.all
  end

  def show
    @stadium = Stadium.find(params[:id])
    @post = Post.new
    @q = @stadium.posts.ransack(params[:q])
    @posts = @q.result
  end
  
  def search
    #@results = @q.result
    #byebug
  end

  private
  def set_q
    #@stadium = Stadium.find(params[:id])
    #@q = @stadium.posts.ransack(params[:q])
    #@q = Post.ransack(params[:q])
  end
end
