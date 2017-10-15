class BooksController < ApplicationController
  def new
    @book = Book.new
    @book.build_cover_photo
    @book.build_pdf
  end

  def create
    @book = Book.new(book_params)
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, cover_photo_attributes: [:file], pdf_attributes: [:file])
  end
end
