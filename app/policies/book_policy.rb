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
    true
  end

  def uploaded_index?
    true
  end

  def subscribed_index?
    true
  end

  def show?
    admin_user? || owner_of_book? || book.status == 'approved'
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    owner_of_book?
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

  private
    def owner_of_book?
      user.id == book.user.id
    end
end

