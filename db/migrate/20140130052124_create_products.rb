class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.string :category
      t.string :type
      t.string :description

      t.timestamps
    end

    create_table "options_products", id: false, force: true do |t|
      t.integer "product_option_id"
      t.integer "product_id"
    end

    add_index :products, :name, unique: true
    add_index :products, :category
    add_index :products, :type
  end
end
