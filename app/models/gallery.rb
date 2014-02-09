class Gallery < ActiveRecord::Base
	has_many :gallery_indices
	has_many :images, through: :gallery_indices

	before_create :set_default_title
	
	private
		def set_default_title
			self.title = self.name
		end
end
