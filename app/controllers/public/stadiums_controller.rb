class Public::StadiumsController < ApplicationController
  def index
    @stadiums = Stadium.all
  end

  def show
    @stadium = Stadium.find(params[:id])
    @post = Post.new
    @posts = @stadim.posts
  end
end
