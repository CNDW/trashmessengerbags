class AddPropertiesToProductTypes < ActiveRecord::Migration
  def up
  	add_column :product_types, :properties, :hstore
  end
  def down
  	remove_column :product_types, :properties
  end
end
