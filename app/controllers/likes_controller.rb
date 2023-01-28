class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_post_path(@like.author, @like.post), notice: 'You have liked this post' }
      else
        @user = Post.find(params[:user_id])
        @post = Post.find(params[:post_id])
        flash[:error] = @like.errors.full_messages
        format.html { redirect_to user_post_path(@user, @post) }
      end
    end
  end
end