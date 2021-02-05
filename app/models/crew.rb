class Crew < ApplicationRecord
  has_many :members, class_name: 'User', dependent: :destroy
  has_many :posts, through: :members
  has_secure_token :join_code

  validates :join_code, :name, uniqueness: true

  def to_param
    name.downcase.gsub(/\s+/, '')
  end
end
