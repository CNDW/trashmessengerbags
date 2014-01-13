class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :value
      t.string :desc
      t.string :available_types, array: true, default: []

      t.timestamps
    end
  end
end
