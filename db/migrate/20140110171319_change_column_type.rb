class ChangeColumnType < ActiveRecord::Migration
  def change
    remove_column :products, :pid, :integer
    add_column :products, :pid, :string
  end
end
