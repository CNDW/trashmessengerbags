class RemoveDescFromDb < ActiveRecord::Migration
  def change
  	remove_column :galleries, :slideshow
  	remove_column :galleries, :desc
  	remove_column :images, :desc
  	remove_column :product_types, :desc
  	remove_column :products, :desc
  	remove_column :custom_fields, :show_public
  	add_column :custom_fields, :catalogue, :boolean, index: true
  	add_column :custom_fields, :custom_shop, :boolean, index: true
  	add_column :custom_fields, :in_stock, :boolean, index: true
  end
  def up
  	add_column :galleries, :properties, :hstore
  	add_column :images, :properties, :hstore
  end
  def down
  	remove_column :galleries, :properties
  	remove_column :images, :properties
  end
end
