module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "notification is-info"
    when 'success' then "notification is-success"
    when 'error' then "notification is-danger"
    when 'alert' then "notification is-primary"
    end
  end

  def format_datetime(datetime)
    return unless datetime

    datetime.in_time_zone("Pacific Time (US & Canada)")
            .strftime('%b. %e %Y, %l:%M%P')
  end

  def background_image_css
    photo_url = @post ? @post.background_image&.image_url : Image.default_background_image&.urls&.regular

    build_css(photo_url: photo_url) if photo_url
  end

  def footer_credit_links
    credit = Image.credit
    unsplash_credit = Image.unsplash_credit
    sanitize("Background by #{ link_to(credit.name, credit.url, target: :_blank) } " +
                 " on #{ link_to unsplash_credit.text, unsplash_credit.url, target: :_blank }")
  end

  private

  def build_css(photo_url:)
    sanitize("background-image: linear-gradient(to top, rgba(32,26,22,.5), rgba(32,26,22,.5)),
                                  url('#{photo_url}');
                background-size: auto, cover;
                background-attachment: fixed, fixed;
                background-position: center, center;
                height: 100%;")
  end
end
