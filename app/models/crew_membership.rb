class CrewMembership < ApplicationRecord
  belongs_to :crew
  belongs_to :user
end
