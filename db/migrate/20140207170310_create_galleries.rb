class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :name
    	t.string :desc
    	t.string :title
    	t.boolean :slideshow
      t.timestamps
    end
    create_table :gallery_indices, id: false do |t|
    	t.references :gallery_indexable, polymorphic: true
    	t.references :gallery
    	t.references :image
    end
    change_table :images do |t|
    	t.remove :imageable_type, :imageable_id, :gallery_id
    	t.string :name
    end
  end
end
