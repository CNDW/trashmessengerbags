class CreateProductModels < ActiveRecord::Migration
  def change
    create_table :product_models do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :value
      t.string :desc
      t.string :available_options, array: true, default: []
      t.string :available_colors, array: true, default: []
      t.string :available_sizes, array: true, default: []
      t.string :item_type

      t.timestamps
    end
  end
end
