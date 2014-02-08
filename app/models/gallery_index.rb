class GalleryIndex < ActiveRecord::Base
	belongs_to :gallery, autosave: true
	belongs_to :image, autosave: true
	belongs_to :gallery_indexable, polymorphic: true, autosave: true
end