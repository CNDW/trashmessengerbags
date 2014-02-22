class Image < ActiveRecord::Base
	has_many :gallery_indices, dependent: :destroy, autosave: true
	has_many :galleries, through: :gallery_indices, autosave: true
	mount_uploader :image_data, ImageUploader

  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  validates :image_data, presence: true

  def thumbnail
  	self.image_data_url(:thumb)
  end

end
