class RenameProductModelsProductOptionsTable < ActiveRecord::Migration
  def change
    rename_table :product_models_product_options, :product_models_options
  end
end
