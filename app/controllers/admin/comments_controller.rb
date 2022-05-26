class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all
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
    comment.destroy
    redirect_to admin_posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
