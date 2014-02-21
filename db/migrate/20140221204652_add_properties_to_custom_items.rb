class AddPropertiesToCustomItems < ActiveRecord::Migration
  def up
  	add_column :custom_items, :properties, :hstore
  end
  def down
  	remove_column :custom_items, :properties
  end
end
