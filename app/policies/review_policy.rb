class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  include AdminPolicyTemplate

  def index?
    admin_user?
  end
end
