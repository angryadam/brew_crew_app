class CommentPolicy < ApplicationPolicy

  def initialize(user, comment)
    @user = user
    @comment = comment
    @crew_membership = CrewMembership.find_by(crew_id: comment.crew_id, user_id: user.id)
  end

  def destroy?
    user.admin? || crew_membership&.crew_admin? || comment_belongs_to_user?
  end

  private

  attr_reader :comment, :crew_membership

  def comment_belongs_to_user?
    user == comment.commented_by
  end
end
