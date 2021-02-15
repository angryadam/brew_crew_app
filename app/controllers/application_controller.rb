class ApplicationController < ActionController::Base
  include Clearance::Controller, Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_current_crew
    unless (@crew = Crew.includes(:posts).find_by_param(params[:crew_id]))
      @crew = current_user.crews.first
      if params[:crew_id].present?
        flash[:error] = "Unable to find the crew #{params[:crew_id]}, try again!"
      end
      redirect_to crew_posts_path(@crew)
    end
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to do that! If you think you should be, let 🧔🏻 know."
    redirect_to(request.referrer || root_path)
  end
end
