class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def send_off
    @user = User.find(params[:id])
  end

  def out
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    redirect_to admin_user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :is_valid)
  end
end
