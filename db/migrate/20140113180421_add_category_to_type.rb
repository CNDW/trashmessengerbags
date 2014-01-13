class AddCategoryToType < ActiveRecord::Migration
  def change
    add_column :product_types, :item_category, :string
  end
end
