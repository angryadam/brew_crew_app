class AddLiveAndArchiveToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :live, :boolean, default: false, null: false
    add_column :posts, :archived, :boolean, default: false, null: false
  end
end
