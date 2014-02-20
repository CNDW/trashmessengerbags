class AddPropertiesToProducts < ActiveRecord::Migration
  def up
  	execute 'CREATE EXTENSION hstore'

    add_column :products, :properties, :hstore
  end
  def down
  	execute 'DROP EXTENSION hstore'

    remove_column :products, :properties
  end
end
