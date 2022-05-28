class Admin::ClubsController < ApplicationController

  before_action :correct_user

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to admin_clubs_path
    else
      @q = Club.ransack(params[:q])
      @clubs = @q.result.page(params[:page])
      render :index
    end
  end

  def index
    @club = Club.new
    @q = Club.ransack(params[:q])
    @clubs = @q.result.page(params[:page])
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

  def correct_user
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end

end
