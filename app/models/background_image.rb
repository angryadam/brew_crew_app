class BackgroundImage < Image
  UNSPLASH_ATTRIBUTION_URL = "https://unsplash.com/?utm_source=#{Rails.application.credentials.dig(:unsplash, :utm_source)}&utm_medium=referral"
  belongs_to :post

  def self.default
    photo = Unsplash::Photo.find('08tX2fsuSLg')
    if photo
      OpenStruct.new(attribution_name: photo.user.name,
                     attribution_url: photo.user.links.html,
                     image_url: photo.urls.regular)
    end
  rescue Unsplash::NotFoundError => _
    nil
  end
end
