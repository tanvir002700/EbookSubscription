class BooksController < ApplicationController
  private
  def person_params
    params.require(:book).permit(:title, :description)
  end
end
