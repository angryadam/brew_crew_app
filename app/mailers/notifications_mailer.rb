class NotificationsMailer < ApplicationMailer

  def new_live_post(post_id:, member_id:, crew_id:)
    @post = Post.find_by_id(post_id)
    @user = User.find_by_id(member_id)
    @crew = Crew.find_by_id(crew_id)

    mail to: @user.email, subject: "New post for your Advent Crew!"
  end
end
