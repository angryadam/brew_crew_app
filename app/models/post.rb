class Post < ApplicationRecord
  belongs_to :user
  has_many :background_images, class_name: 'BackgroundImage'
  has_many :header_images, class_name: 'HeaderImage'

  has_rich_text :body
  validates :body, presence: true
  alias_method :posted_by, :user

  after_initialize :add_default_text, unless: :persisted?

  private

  def add_default_text
    return unless self.body.blank?

    self.body = Api::HipsterIpsum.default_text
  end
end
