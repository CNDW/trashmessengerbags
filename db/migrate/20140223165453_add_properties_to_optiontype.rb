class AddPropertiesToOptiontype < ActiveRecord::Migration
  def up
  	add_column :option_types, :properties, :hstore
  end
  def down
  	remove_column :option_types, :properties
  end
end
