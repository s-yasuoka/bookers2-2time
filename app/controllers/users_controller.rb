class UsersController < ApplicationController
  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "show"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
