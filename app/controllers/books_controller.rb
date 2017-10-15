class BooksController < ApplicationController
  before_action :set_book

  def index
    @books = Book.all
  end

  def new; end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Created new book'
      redirect_to books_path
    else
      flash[:error] = 'Book not created'
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :cover_photo, :pdf)
  end

  def set_book
    @book = Book.new
  end
end
