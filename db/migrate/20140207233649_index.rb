class Index < ActiveRecord::Migration
  def change
  	drop_table :gallery_indices
  	create_table :gallery_indices do |t|
    	t.references :gallery_indexable, polymorphic: true
    	t.references :gallery
    	t.references :image
    end
  end
end
