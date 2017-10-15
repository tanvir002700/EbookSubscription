class BooksController < ApplicationController
  def new
    @book = Book.new
    @book.build_cover_photo
    @book.build_pdf
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Created new book'
      redirect_to home_index_path
    else
      flash[:error] = 'Book not created'
      render 'new'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, cover_photo_attributes: [:id, :file], pdf_attributes: [:id, :file])
  end
end
