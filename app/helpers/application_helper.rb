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
    default_photo_url = 'https://images.unsplash.com/photo-1505075106905-fb052892c116?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxODg3OTh8MHwxfGFsbHx8fHx8fHx8&ixlib=rb-1.2.1&q=80&w=1080&utm_source=brew-crew-app&utm_medium=referral&utm_campaign=api-credit'
    # default_photo_url = Unsplash::Photo.find('08tX2fsuSLg').urls.regular
    sanitize("background-image: linear-gradient(to top, rgba(32,26,22,.5), rgba(32,26,22,.5)),
                                url('#{default_photo_url}');
              background-size: auto, cover;
              background-attachment: fixed, fixed;
              background-position: center, center;
              height: 100%;")
  end
end
