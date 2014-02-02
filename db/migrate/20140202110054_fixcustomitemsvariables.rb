class Fixcustomitemsvariables < ActiveRecord::Migration
  def change
  	remove_column :custom_items, :product_type_id
  	remove_column :custom_items, :product_model_id
  	add_column :custom_items, :category, :string
  end
end
