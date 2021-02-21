class AddRolesToCrewMemberships < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :crew_admin, :boolean, default: false, null: false
    remove_column :users, :poster, :boolean, default: true, null: false

    add_column :crew_memberships, :crew_admin, :boolean, default: false, null: false
    add_column :crew_memberships, :poster, :boolean, default: false, null: false
  end
end
