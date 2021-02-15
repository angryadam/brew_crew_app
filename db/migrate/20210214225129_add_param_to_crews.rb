class AddParamToCrews < ActiveRecord::Migration[6.0]
  def change
    add_column :crews, :param, :string
  end
end
