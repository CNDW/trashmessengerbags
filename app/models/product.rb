class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy, autosave: true
  has_many :images, through: :gallery_indices, autosave: true
  has_many :galleries, through: :gallery_indices, autosave: true
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :options, as: :customizable, dependent: :destroy
  has_many :sizes, through: :options, autosave: true
  has_many :colors, through: :options, autosave: true
  has_many :extras, through: :options, autosave: true
  belongs_to :product_category, autosave: true
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  after_update :post_images_to_gallery

  def option_list#need to update for new option structure
  end

  def post_images_to_gallery
    if self.galleries.exists?(name: self.name)
      Gallery.find_by(name: self.name).images=self.images
    else
      self.galleries<<Gallery.create(name: self.name, images: self.images)
    end
  end

end