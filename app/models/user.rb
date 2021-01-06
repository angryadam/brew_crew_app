class User < ApplicationRecord
  include Clearance::User
  has_person_name

  belongs_to :crew
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def to_param
    (first_name.first + last_name).downcase
  end
end
