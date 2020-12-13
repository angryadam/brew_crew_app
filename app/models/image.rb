class Image < ApplicationRecord
  validates :image_url, presence: true

  def self.default_background_image
    Unsplash::Photo.find('08tX2fsuSLg')
  end

  def self.credit
    if false #(image = Unsplash::Photo.find('08tX2fsuSLg'))
      OpenStruct.new(name: image.user.name,
                     url: image.user.links.html)
    else
      OpenStruct.new(name: 'Christin Hume',
                     url: "https://unsplash.com/@christinhumephoto?utm_source=#{Rails.application.credentials.unsplash[:utm_source]}" +
                               '&utm_medium=referral&utm_campaign=api-credit')
    end
  end

  def self.unsplash_credit
    OpenStruct.new(text: 'Unsplash',
                   url: "https://unsplash.com/?utm_source=#{Rails.application.credentials.unsplash[:utm_source]}" +
                             '&utm_medium=referral&utm_campaign=api-credit')
  end

end
