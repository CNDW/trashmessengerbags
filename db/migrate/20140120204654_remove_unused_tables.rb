class RemoveUnusedTables < ActiveRecord::Migration
  def change
    drop_table :line_items
    drop_table :products
  end
end
