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
end
