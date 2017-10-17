class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.current_status = params[:review][:book][:status]
      if @review.save
        @book.update_status(params[:review][:book][:status]) if current_user.roles?(:admin)
        redirect_to [@book, @review], notice: 'Review was successfully created.'
      else
        render :new
      end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_review
      @review = @book.reviews.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description, :previous_status)
    end
end

