class User < ApplicationRecord
  include Clearance::User
  has_person_name
end
