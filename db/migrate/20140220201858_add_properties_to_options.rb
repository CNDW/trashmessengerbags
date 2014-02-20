class AddPropertiesToOptions < ActiveRecord::Migration
  def up
    add_column :options, :properties, :hstore
  end
  def down
    remove_column :options, :properties
  end
end
