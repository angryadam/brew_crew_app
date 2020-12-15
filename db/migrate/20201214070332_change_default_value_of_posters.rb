class ChangeDefaultValueOfPosters < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :poster, from: true, to: false)
  end
end
