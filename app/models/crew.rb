class Crew < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :posts, through: :users
  has_secure_token :join_code

  validates :join_code, :name, uniqueness: true

  def to_param
    name.downcase.parameterize
  end
end
