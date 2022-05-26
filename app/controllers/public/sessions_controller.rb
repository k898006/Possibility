# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(current_user), notice: 'ゲストユーザーとしてログインしました'
  end

  def after_sign_in_path_for(resource)
    stadiums_path
  end

  def reject_inactive_user
    @user = User.find_by(email: paramas[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_valid == true)
        flash[:notice] = "利用方法に問題がため、退会処分となったアカウントです"
        redirect_to root_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
