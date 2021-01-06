class Post < ApplicationRecord
  belongs_to :user
  has_one :background_image, class_name: 'BackgroundImage', dependent: :destroy
  has_many :header_images, class_name: 'HeaderImage', dependent: :destroy
  has_many :comments

  accepts_nested_attributes_for :background_image,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image_url'].blank? }

  has_rich_text :body
  validates :body, presence: true
  alias_method :posted_by, :user

  before_validation :add_default_text

  default_scope { order(created_at: :desc) }
  scope :in_progress, -> { where(live: false, archived: false) }
  scope :live, -> { where(live: true) }
  scope :archived, -> { where(archived: true) }

  private

  def add_default_text
    return unless self.body.blank?

    self.body = Api::HipsterIpsum.default_text
  end
end
