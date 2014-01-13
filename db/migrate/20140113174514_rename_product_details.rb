class RenameProductDetails < ActiveRecord::Migration
  def change
    rename_column :products, :product_category, :item_category
    rename_column :products, :product_type, :item_type
    rename_column :products, :product_model, :item_model
  end
end
