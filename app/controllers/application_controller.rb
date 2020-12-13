class ApplicationController < ActionController::Base
  include Clearance::Controller

  def get_user_crew
    @crew = current_user.crew
  end
end
