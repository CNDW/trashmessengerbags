class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :type
      t.integer :price
      t.integer :pid
      t.string :product_model
      t.string :category

      t.timestamps
    end
  end
end
