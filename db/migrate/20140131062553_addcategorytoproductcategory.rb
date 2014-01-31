class Addcategorytoproductcategory < ActiveRecord::Migration
  def change
  	add_column :product_categories, :category, :string
  	add_column :products, :product_category_id, :integer
  end
end
