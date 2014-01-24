class AddTableForAssociationBetweenItemsAndOptions < ActiveRecord::Migration
  def change
    create_table :product_models_product_options, id: false do |t|
      t.integer :product_model_id
      t.integer :product_option_id
    end
    remove_column :product_options, :product_model_id, :integer
  end
end
