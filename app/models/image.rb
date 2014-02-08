class Image < ActiveRecord::Base
	has_many :gallery_indices, dependent: :destroy, autosave: true
	has_many :galleries, through: :gallery_indices
	has_many :products, through: :gallery_indices, source: :gallery_indexable, source_type: "Product", autosave: true
	has_many :product_options, through: :gallery_indices, source: :gallery_indexable, source_type: "ProductOption", autosave: true
	has_many :product_categories, through: :gallery_indices, source: :gallery_indexable, source_type: "ProductCategory", autosave: true
	mount_uploader :image_data, ImageUploader
end
