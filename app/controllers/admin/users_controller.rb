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

  def send_off
    @user = User.find(params[:id])
  end

  def out
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to admin_user_path(@user)
  end

  private
  def user_params
    params.require(user).permit(:name, :introduction)
  end
end
