class RenameProductCategoryIdColumns < ActiveRecord::Migration
  def change
  	rename_column :custom_items, :product_category_id, :product_type_id
    rename_column :products, :product_category_id, :product_type_id
  end
end
