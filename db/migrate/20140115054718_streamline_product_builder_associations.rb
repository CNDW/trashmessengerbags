class StreamlineProductBuilderAssociations < ActiveRecord::Migration
  def change
    change_table :product_types do |t|
      t.references :product_category
    end
    
    change_table :product_models do |t|
      t.references :product_type
    end
      
  end
end
