class ChangeColumnTypeToProductType < ActiveRecord::Migration
  def change
    remove_column :products, :type, :string
    add_column :products, :product_type, :string
  end
end
