class BooksController < ApplicationController
  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to "/books"
    end
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to book_path(@book_new), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    # if @book.user == current_user
    if  @book.update(book_params)
      redirect_to book_path, notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user == current_user
      @book.destroy
      redirect_to "/books"
    else
      render book_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
