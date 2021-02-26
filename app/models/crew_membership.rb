class CrewMembership < ApplicationRecord
  belongs_to :crew
  belongs_to :user

  alias_method :member, :user
end
