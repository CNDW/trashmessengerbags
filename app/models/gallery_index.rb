class GalleryIndex < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :image
	belongs_to :gallery_indexable, polymorphic: true

end