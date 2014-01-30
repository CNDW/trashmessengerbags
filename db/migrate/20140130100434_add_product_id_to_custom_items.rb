class AddProductIdToCustomItems < ActiveRecord::Migration
  def change
  	add_column :custom_items, :product_id, :integer
  end
end
