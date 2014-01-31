class Dropdepricatedtables < ActiveRecord::Migration
  def change
  	drop_table :product_models
  	drop_table :product_types
  	drop_table :product_models_options
  	remove_index :products, :category
  	remove_index :products, :prod_type
  	remove_column :products, :category
  	remove_column	:products, :prod_type
  	rename_column :products, :description, :desc
  	add_column :product_options, :desc, :string
  	add_column :product_options, :price, :decimal, precision: 8, scale: 2
  end
end
