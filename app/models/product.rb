class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy
  has_many :galleries, through: :gallery_indices, dependent: :destroy
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :options, as: :optionable, dependent: :destroy
  has_many :sizes, through: :options, autosave: true
  has_many :colors, through: :options, autosave: true
  has_many :extras, through: :options, autosave: true
  belongs_to :product_category, autosave: true
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => proc{ |attr| attr[:image_data].nil? }


  def option_list#need to update for new option structure
  end

  def thumbs
    self.images.map { |img| img.thumb }
  end

  def categorization
    self.product_category.category
  end

  def catalogue_image
    return Image.first.image_data_url.to_s if self.images.empty?
    return self.images.first.image_data_url.to_s if !self.images.empty?
  end

end