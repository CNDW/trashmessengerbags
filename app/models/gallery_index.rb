class GalleryIndex < ActiveRecord::Base
	belongs_to :gallery, autosave: true
	belongs_to :image, autosave: true
	belongs_to :gallery_indexable, polymorphic: true, autosave: true

	after_create :link_product_image_to_type, if: Proc.new { |index| index.gallery_indexable_type == "Product"}
	after_destroy :destroy_empty_gallery, if: Proc.new { |index| !index.gallery_id.nil? }


	def destroy_empty_gallery
		gallery = self.gallery
		gallery.destroy if gallery.images.empty?
	end

	def link_product_image_to_type
		self.gallery_indexable.type_images<<self.image
	end
end