class AddModelSupportForTypes < ActiveRecord::Migration
  def change
    add_column :product_types, :has_models, :boolean
    add_column :product_types, :available_options, :string, array: true, default: []
    add_column :product_types, :available_colors, :string, array: true, default: []
    add_column :product_types, :available_sizes, :string, array: true, default: []
  end
end
