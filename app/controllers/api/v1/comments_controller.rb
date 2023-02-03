class Api::V1::CommentsController < ActionController::API
  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments, status: :ok
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)

    if comment.save
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
