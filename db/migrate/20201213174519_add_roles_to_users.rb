class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :crew_admin, :boolean, default: false, null: false
    add_column :users, :poster, :boolean, default: true, null: false
  end
end
