module FormHelper
	def setup_image_upload(image_owner)
		image_owner.images.build unless image_owner.errors.any?
		image_owner
	end
end