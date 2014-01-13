class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :value
      t.string :desc
      t.string :available_models, array: true, default: []

      t.timestamps
    end
  end
end
