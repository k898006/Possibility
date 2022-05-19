class Admin::StadiumsController < ApplicationController
  def new
    @stadium = Stadium.new
  end

  def create
    @stadium = Stadium.new(stadium_params)
    @club = Club.find(params[:stadium][:club_id])
    @stadium.club_id = @club.id
    if @stadium.save
      redirect_to admin_stadium_path(@stadium)
    else
      render :new
    end
  end

  def index
    @stadiums = Stadium.all
  end

  def show
    @stadium = Stadium.find(params[:id])
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
    params.require(:stadium).permit(:name)
  end
end
