class PostPolicy < ApplicationPolicy

  def initialize(user, post)
    @user = user
    @post = post
    @crew_membership = CrewMembership.find_by(crew_id: post.crew_id, user_id: user.id)
  end

  def create?
    user.admin? || crew_membership&.crew_admin? || crew_membership&.poster?
  end

  def update?
    post_belongs_to_user?
  end

  def destroy?
    user.admin? || crew_membership&.crew_admin? || post_belongs_to_user?
  end

  def go_live?
    user.admin? || crew_membership&.crew_admin? || post_belongs_to_user?
  end

  def archive?
    user.admin? || post_belongs_to_user?
  end

  def remove_header_images?
    user.admin? || crew_membership&.crew_admin? || post_belongs_to_user?
  end

  private

  attr_reader :post, :crew_membership

  def post_belongs_to_user?
    user == post.posted_by
  end
end
