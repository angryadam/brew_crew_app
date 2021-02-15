class CreateCrewMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :crew_memberships do |t|
      t.belongs_to :crew, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
