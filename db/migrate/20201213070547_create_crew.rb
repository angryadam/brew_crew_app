class CreateCrew < ActiveRecord::Migration[6.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.string :join_code

      t.timestamps
    end

    add_index :crews, :join_code, unique: true
    add_belongs_to :users, :crew, foreign_key: true
  end
end
