class CreateCustomizers < ActiveRecord::Migration
  def change
    create_table :customizers do |t|
      t.belongs_to :customizable, index: true, polymorphic: true
      t.integer :option_id, index: true

      t.timestamps
    end
    drop_table :extras
    drop_table :colors
    drop_table :sizes
    drop_table :options
    create_table :options do |t|
    	t.belongs_to :option_type, index: true
    	t.string :name
    	t.decimal :price, precision: 8, scale: 2

    	t.timestamps
    end
  end

  def up
    add_column :options, :properties, :hstore
  end
  def down
    remove_column :options, :properties
  end
end
