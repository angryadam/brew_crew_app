module PostHelper
  def index_title_text(is_poster:, crew_name:)
    is_poster ? 'Your Posts' : "#{crew_name} Posts"
  end

  def byline_text(name:, updated_at:)
    "by #{name} at #{format_datetime(updated_at)}"
  end

  def comment_heading_text(num_of_comments:)
    base_text = 'Comments'
    num_of_comments.zero? ? base_text : base_text + " (#{num_of_comments})"
  end
end
