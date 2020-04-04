class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	book.save
  	redirect_to book_path(book.id)
  	# redirect_to user_path(resource.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
   params.require(:book).permit(:title, :body, :user_id)
  end
  # form_forを使うときは、Strong Parametersの定義が必要
end
