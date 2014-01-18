class AddVarsToLineitem < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.string :item_category
      t.string :item_type
      t.string :item_model
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
