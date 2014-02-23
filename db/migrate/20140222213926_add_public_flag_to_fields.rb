class AddPublicFlagToFields < ActiveRecord::Migration
  def change
  	add_column :product_fields, :public, :boolean
  	add_column :option_fields, :public, :boolean
  end
end
