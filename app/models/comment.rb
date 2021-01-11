class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true
  alias_method :commented_by, :user

  before_validation :add_default_text

  private

  def add_default_text
    return unless self.text.blank? && Rails.env.development?

    self.text = Api::HipsterIpsum.default_text
  end
end
