class RemoveArraysFromDb < ActiveRecord::Migration
  def change
    remove_column :product_categories, :available_types, :string
    change_table :product_models do |t|
      t.remove :available_options, :available_colors, :available_sizes, :item_type
    end
    change_table :product_types do |t|
      t.remove :available_options, :available_colors, :available_sizes, :item_category, :available_models, :has_models
    end
  end
end
