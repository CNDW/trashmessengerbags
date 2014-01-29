class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.references :imageable, polymorphic: true
      t.string :desc
      t.string :image_data
      t.integer :gallery_id

      t.timestamps
    end
  end
end
