class AddAttributionNameAndAttributionUrlToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :attribution_name, :string
    add_column :images, :attribution_url, :text
  end
end
