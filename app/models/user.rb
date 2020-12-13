class User < ApplicationRecord
  include Clearance::User
  has_person_name

  belongs_to :crew
  has_many :posts, dependent: :destroy

  def to_param
    (first_name.first + last_name).downcase
  end
end
