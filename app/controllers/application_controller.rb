class ApplicationController < ActionController::Base
  include Clearance::Controller, Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def get_user_crew
    @crew = current_user.crew
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to do that! If you think you should be, let 🧔🏻 know."
    redirect_to(request.referrer || root_path)
  end
end
