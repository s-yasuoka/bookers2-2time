class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def updated
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(user.id)
  end

end
