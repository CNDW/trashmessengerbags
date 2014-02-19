class RenameProductCategorytable < ActiveRecord::Migration
  def change
  	rename_table :product_categories, :product_types
  end
end
