class Image < ActiveRecord::Base
	belongs_to :imageable, polymorphic: true
	belongs_to :gallery
	mount_uploader :image_data, ImageUploader
end
