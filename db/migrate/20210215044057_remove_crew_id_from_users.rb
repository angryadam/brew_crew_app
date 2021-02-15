class RemoveCrewIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    # remove_column :users, :crew_id, type: :bigint
    remove_belongs_to :users, :crew
  end
end
