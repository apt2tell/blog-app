class Api::V1::UsersController < ActionController::API

  def index
    users = User.all
    render json: users, status: :ok
  end


end
