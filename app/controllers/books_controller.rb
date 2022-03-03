class BooksController < ApplicationController
  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @book_new.save
    redirect_to books_path
  end

  def updated
    @book = Book.find(params[:id])
    @book.update
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
