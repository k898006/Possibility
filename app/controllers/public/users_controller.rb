class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    #ゲストユーザーページへアクセスしようとした場合、スタジアム一覧へ遷移
    if @user.email == "guest@example.com"
      redirect_to stadiums_path
    else
      @posts = @user.posts.page(params[:page]).order(created_at: "DESC")
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else render :edit
    end
  end

  def likes
    @user = User.find(params[:id])
    #ゲストユーザーのいいね一覧へアクセスしようとした場合、スタジアム一覧へ遷移
    if @user.email == "guest@example.com"
      redirect_to stadiums_path
    else
      likes = Like.where(user_id: @user.id).pluck(:post_id)
      @posts = Post.find(likes)
      @like_posts = Kaminari.paginate_array(@posts).page(params[:page])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to stadiums_path
    end
  end

end
