module SUBSCRIPTION
  class Subscribe
    def initialize(user, book)
      @user = user
      @book = book
    end

    def create
      raise ArgumentError.new("Book isn't published yet.") unless @book.status == :approved
      @user.subscribe_books << @book
    end

    def delete
      @user.subscribe_books.destroy(@book)
    end

    def is_subscriber?
      @user.subscribe_books.find_by(id: @book.id).present?
    end
  end
end

