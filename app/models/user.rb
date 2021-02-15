class User < ApplicationRecord
  include Clearance::User
  has_person_name

  has_many :crew_memberships
  has_many :crews, through: :crew_memberships
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def to_param
    (first_name.first + last_name).downcase
  end

  def has_many_crews?
    crews.size > 1
  end
end
