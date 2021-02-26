class CrewMembershipsController < ApplicationController
  before_action :require_login
  before_action :set_crew_membership

  def destroy
    authorize @crew_membership

    @crew_membership.destroy
  end

  private

  def set_crew_membership
    @crew_membership = CrewMembership.find_by_id(params[:id])
  end
end
