class Gallery < ActiveRecord::Base
	has_many :gallery_indices
	has_many :images, through: :gallery_indices
end
