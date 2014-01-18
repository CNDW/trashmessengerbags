class RemoveValueVariable < ActiveRecord::Migration
  def change
    remove_column :product_categories, :value, :string
    remove_column :product_types, :value, :string
    remove_column :product_models, :value, :string
  end
end
