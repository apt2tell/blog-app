class Api::V1::CommentsController < ActionController::API
  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments, status: :ok
  end
end
