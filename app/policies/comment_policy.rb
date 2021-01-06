class CommentPolicy < ApplicationPolicy

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.admin? || user.crew_admin? || comment_belongs_to_user?
  end

  private

  attr_reader :comment

  def comment_belongs_to_user?
    user == comment.commented_by
  end
end
