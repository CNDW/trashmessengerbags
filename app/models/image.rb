class Image < ActiveRecord::Base
	has_many :gallery_indices, dependent: :destroy, autosave: true
	has_many :galleries, through: :gallery_indices, autosave: true
	has_many :products, through: :gallery_indices, source: :gallery_indexable, source_type: "Product", autosave: true
	mount_uploader :image_data, ImageUploader


  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  def thumb
  	self.image_data_url(:thumb)
  end

end
