class BookPolicy < ApplicationPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  def index?
    admin_user?
  end

  def edit?
    update?
  end

  def update?
    book.user.id == user.id
  end

  def subscribe?
    book.user.id != user.id
  end

  def unsubscribe?
    subscribe?
  end
end
