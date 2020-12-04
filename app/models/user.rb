class User < ApplicationRecord
  include Clearance::User
  has_person_name

  has_many :posts
end
