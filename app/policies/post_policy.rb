class PostPolicy < ApplicationPolicy

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.admin? || user.crew_admin? || user.poster?
  end

  def update?
    post_belongs_to_user?
  end

  def destroy?
    user.admin? || user.crew_admin? || post_belongs_to_user?
  end

  def go_live?
    user.admin? || user.crew_admin? || post_belongs_to_user?
  end

  def archive?
    post_belongs_to_user?
  end

  private

  attr_reader :post

  def post_belongs_to_user?
    user == post.posted_by
  end
end
