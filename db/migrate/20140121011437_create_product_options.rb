class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.string :name
      t.references :product_model

      t.timestamps
    end
  end
end
