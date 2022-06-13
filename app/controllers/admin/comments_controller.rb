class Admin::CommentsController < ApplicationController

  before_action :correct_user

  def index
    @q = Comment.ransack(params[:q])
    @comments = @q.result.page(params[:page]).order(created_at: "DESC")
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = post.id
    if comment.save
      redirect_to admin_post_path(post)
    else
      render :show
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to admin_post_path(post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def correct_user
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end
end
