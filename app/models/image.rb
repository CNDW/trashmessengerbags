class Image < ActiveRecord::Base
	has_many :gallery_indices, dependent: :destroy
	has_many :galleries, through: :gallery_indices
	#has_many :products, through: :gallery_indices, source: :gallery_indexable, source_type: "Product"

	mount_uploader :image_data, ImageUploader
end
