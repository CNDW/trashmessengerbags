class RenameFieldType < ActiveRecord::Migration
  def change
  	drop_table :product_fields
  	drop_table :option_fields
  end
end
