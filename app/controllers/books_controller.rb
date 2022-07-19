class BooksController < ApplicationController
  def index
    @books = Book.all
    @booknew = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

# ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
