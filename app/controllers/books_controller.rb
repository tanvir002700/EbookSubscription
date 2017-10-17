class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :delete, :subscribe, :unsubscribe]

  def index
    @books = Book.all
  end

  def published_index
    @books = Book.where(status: :approved)
    render :index
  end

  def uploaded_index
    @books = current_user.books
    render :index
  end

  def subscribed_index
    @books = current_user.subscribe_books
    render :index
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      flash[:success] = 'Created new book'
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    authorize @book
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def subscribe
    authorize @book
    begin
      if SUBSCRIPTION::Subscribe.new(current_user, @book).create
        flash[:error] = 'Subscribe Successfully.'
      else
        render flash: { error: 'Something went wrong.' }
      end
    rescue
      flash[:alert] = 'You are not allow to subscribe.'
      redirect_to(request.referrer || @book) and return
    end
    redirect_to @book
  end

  def unsubscribe
    authorize @book
    begin
      if SUBSCRIPTION::Subscribe.new(current_user, @book).delete
        flash[:error] = 'Subscribe Successfully.'
      else
        render flash: { error: 'Something went wrong.' }
      end
    rescue Exception => e
      flash[:alert] = e.message
      redirect_to(request.referrer || @book) and return
    end
    redirect_to @book
  end

  def destroy
    if @book.destroy
      redirect_to books_path, flash: { success: 'Delete Successfully.' }
    else
      redirect_to books_path, flash: { error: 'Something went wrong.' }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :cover_photo, :pdf)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
