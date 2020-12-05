class Post < ApplicationRecord
  belongs_to :user
  has_many :background_images, class_name: 'BackgroundImage'
  has_many :header_images, class_name: 'HeaderImage'

  validates :body, presence: true
end
