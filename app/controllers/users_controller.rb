class UsersController < Clearance::UsersController
  before_action :redirect_signed_in_users
  before_action :get_crew_by_join_code
  skip_before_action :require_login, raise: false

  def create
    @user = User.new(user_params).tap { |u| u.crews << @crew }

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def get_crew_by_join_code
    join_code = params[:user][:crew_join_code]
    unless (@crew = Crew.find_by(join_code: join_code))
      flash.now[:error] = "Unable to find a crew with that code! 😭 Please verify \"#{join_code}\" is correct and try again."
      render template: "users/new"
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
