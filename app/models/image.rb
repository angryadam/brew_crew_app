class Image < ApplicationRecord
  validates :image_url, presence: true
end
