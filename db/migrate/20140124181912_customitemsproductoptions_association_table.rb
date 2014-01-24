class CustomitemsproductoptionsAssociationTable < ActiveRecord::Migration
  def change
    create_table :custom_items_product_options, id: false do |t|
      t.integer :custom_item_id
      t.integer :product_option_id
    end
  end
end
