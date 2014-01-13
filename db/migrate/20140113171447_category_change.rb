class CategoryChange < ActiveRecord::Migration
  def change
    remove_column :products, :category, :string
    add_column :products, :product_category, :string
  end
end
