class BookPolicy < ApplicationPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  def index?
    admin_user?
  end

  def published_index?
    user.roles?(:user)
  end

  def uploaded_index?
    user.roles?(:user)
  end

  def subscribed_index?
    true
  end

  def create?
    true
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

  def destroy?
    update?
  end
end

