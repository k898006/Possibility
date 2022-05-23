class Public::LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = Like.new
    like.user_id = current_user.id
    like.post_id = @post.id
    like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
  end
end
