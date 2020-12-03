class UsersController < Clearance::UsersController

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
