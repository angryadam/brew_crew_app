module PostHelper
  def index_title_text(is_poster:)
    is_poster ? 'Your Posts' : 'Posts'
  end

  def byline_text(name:, updated_at:)
    "by #{name} at #{format_datetime(updated_at)}"
  end
end
