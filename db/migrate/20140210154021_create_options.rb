class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
    	t.references :customizable, polymorphic: true
    	t.references :optionable, polymorphic: true
    end

    add_index :options, :customizable_id
    add_index :options, :optionable_id

    add_index :gallery_indices, :gallery_indexable_id
    add_index :gallery_indices, :gallery_id
    add_index :gallery_indices, :image_id

    add_index :products, :product_category_id

    drop_table :custom_items_product_options
    drop_table :options_products
    drop_table :product_options
    
    create_table :sizes do |t|
    	t.string :name
    	t.string :desc
    	t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end

    create_table :colors do |t|
    	t.string :name
    	t.string :desc
    	t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end

    create_table :extras do |t|
    	t.string :name
    	t.string :desc
    	t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end

  end
end
