class Post < ApplicationRecord
  belongs_to :user
  belongs_to :crew
  has_one :background_image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :header_images

  accepts_nested_attributes_for :background_image,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image_url'].blank? }

  has_rich_text :body
  validates :body, presence: true
  alias_method :posted_by, :user

  before_validation :add_default_text

  scope :lifo, -> { order(updated_at: :desc) }
  scope :in_progress, -> { where(live: false, archived: false) }
  scope :live, -> { where(live: true, archived: false) }
  scope :archived, -> { where(archived: true) }
  scope :current_users_posts, -> (user_id) { where(user_id: user_id) }
  scope :other_users_posts, -> (user_id) { where.not(user_id: user_id) }
  
  private

  def add_default_text
    return unless self.body.blank? && Rails.env.development?

    self.body = Api::HipsterIpsum.default_text
  end
end
