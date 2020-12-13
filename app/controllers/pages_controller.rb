class PagesController < ApplicationController
  # before_action :check_if_signed_in
  before_action :get_user_crew

  def intro
  end

  private

  # def check_if_signed_in
  #   redirect_to root_path if signed_in?
  # end
end
