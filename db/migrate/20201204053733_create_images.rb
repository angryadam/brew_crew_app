class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :type, null: false
      t.text :image_url

      t.timestamps null: false
    end

    add_index :images, :image_url
  end
end
