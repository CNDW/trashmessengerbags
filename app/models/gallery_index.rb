class GalleryIndex < ActiveRecord::Base
	belongs_to :gallery, autosave: true
	belongs_to :image, autosave: true
	belongs_to :gallery_indexable, polymorphic: true, autosave: true

	after_create :link_to_gallery

	def link_to_gallery
		return if self.gallery_indexable_type.nil?
		if self.gallery_id.nil?
			Gallery.create( name: self.gallery_indexable_type ) if Gallery.find_by( name: self.gallery_indexable_type ).nil?
			self.image.galleries<<Gallery.find_by( name: self.gallery_indexable_type )
		end
	end
end