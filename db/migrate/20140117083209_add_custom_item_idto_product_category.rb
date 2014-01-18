class AddCustomItemIdtoProductCategory < ActiveRecord::Migration
  def change
    change_table :custom_items do |t|
      t.references :product_category
      t.references :product_type
      t.references :product_model
    end
  end
end
