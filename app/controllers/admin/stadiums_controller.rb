class Admin::StadiumsController < ApplicationController


  def create
    @stadium = Stadium.new(stadium_params)
    @club = Club.find(params[:stadium][:club_id])
    @stadium.club_id = @club.id
    if @stadium.save
      redirect_to admin_stadiums_path
    else
      @stadiums = Stadium.all
      render :index
    end
  end

  def index
    @q = Stadium.ransack(params[:q])
    @stadiums = @q.result.page(params[:page])
    @stadium = Stadium.new
  end

  def show
    @stadium = Stadium.find(params[:id])
    @posts = @stadium.posts.page(params[:page])
  end

  def edit
    @stadium = Stadium.find(params[:id])
  end

  def update
    @stadium = Stadium.find(params[:id])
    if @stadium.update(stadium_params)
      redirect_to admin_stadium_path(@stadium)
    else
      render :edit
    end
  end

  private
  def stadium_params
    params.require(:stadium).permit(:name, :club_id)
  end
end
