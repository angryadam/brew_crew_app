module PostHelper
  def byline_text(name:, created_at:)
    "by #{name} at #{format_datetime(created_at)}"
  end
end
