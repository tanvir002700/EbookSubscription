class BooksController < ApplicationController
  before_action :set_book, except: [:index, :published_book]

  def index
    @books = Book.where(status: :published)
  end

  def show; end
  
  def published_book
    @books = current_user.books
  end

  def subscribed_book

  end

  def new; end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      flash[:success] = 'Created new book'
      redirect_to books_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :cover_photo, :pdf)
  end

  def set_book
    @book = current_user.books.find(params[:id]) || current_user.books.new
  end
end
