class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(@comment.author, @comment.post), notice: 'Successfully added a comment'
        end
      else
        @user = Post.find(params[:user_id])
        @post = Post.find(params[:post_id])
        flash[:error] = @comment.errors.full_messages
        format.html { redirect_to user_post_path(@user, @post) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
