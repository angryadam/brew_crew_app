class Crew < ApplicationRecord
  has_many :crew_memberships
  has_many :members, through: :crew_memberships, source: :user
  has_many :posts
  has_secure_token :join_code

  validates :join_code, :name, uniqueness: true

  before_save :set_param

  def to_param
    name.parameterize(separator: '')
  end

  private

  def set_param
    self.param = to_param if name_changed?
  end
end
