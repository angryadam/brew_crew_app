class PostsFacade
  def initialize(user:, crew:)
    @user = user
    @crew = crew
  end

  def live_posts
    @live_posts ||= user.poster? ? user_posts.lifo.live.with_rich_text_body :
                      crew.posts.lifo.live.with_rich_text_body
  end

  def in_progress_posts
    @in_progress_posts ||= user_posts.lifo.in_progress.with_rich_text_body
  end

  def other_posts
    @other_posts ||= crew.posts.other_users_posts(user.id).lifo.live.with_rich_text_body
  end

  private

  attr_reader :user, :crew, :user_posts

  def user_posts
    @user_posts ||= crew.posts.current_users_posts(user.id)
  end
end
