class AddCrewToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :crew, foreign_key: true
  end
end
