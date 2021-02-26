class CrewMembershipPolicy < ApplicationPolicy

  def initialize(user, crew_membership)
    @user = user
    @crew_membership = crew_membership
  end

  def destroy?
    user.admin? || crew_membership&.crew_admin? || membership_belongs_to_user?
  end

  private

  attr_reader :crew_membership

  def membership_belongs_to_user?
    user == crew_membership.member
  end
end
