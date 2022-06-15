class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      render :comments
    else
      @user = @post.user
      @stadium = @post.stadium
      render template: 'public/posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = @post.user
    @stadium = @post.stadium
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :comments
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
