#  /rails/mailers/notifications_mailer/new_live_post

class NotificationsMailerPreview < ActionMailer::Preview
  def new_live_post
    NotificationsMailer.new_live_post(post_id: Post.first.id,
                                      member_id: User.first.id,
                                      crew_id: Crew.first.id)
  end
end
