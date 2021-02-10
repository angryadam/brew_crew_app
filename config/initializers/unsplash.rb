Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.dig(:unsplash, :access_key)
  config.application_secret = Rails.application.credentials.dig(:unsplash, :secret_key)
  config.application_redirect_uri = Rails.application.credentials.dig(:unsplash, :redirect_uri)
  config.utm_source = Rails.application.credentials.dig(:unsplash, :utm_source)
end
