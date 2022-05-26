class Admin::ClubsController < ApplicationController

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to admin_clubs
    else
      @clubs = Club.all
      render :index
    end
  end

  def index
    @club = Club.new
    @clubs = Club.all
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to admin_clubs_path
    else
      render :edit
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :division)
  end

end
