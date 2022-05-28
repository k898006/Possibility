class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      @post = post
      @user = post.user
      @stadium = post.stadium
      @comment = comment
      render template: 'public/posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :image)
  end
end
