class User < ApplicationRecord
  include Clearance::User
  has_person_name

  has_many :posts

  def to_param
    (first_name.first + last_name).downcase
  end
end
