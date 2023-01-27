class UsersController < ApplicationController
  def index
    @users = User.all
   end

  def show
    @user = User.find(params[:id])
    @post = @user.recent_posts
  end
end
