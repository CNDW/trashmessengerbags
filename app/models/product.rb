class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy
  has_many :customizers, as: :customizable, dependent: :destroy
  has_many :options, through: :customizers, dependent: :destroy
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :custom_fields, as: :fieldable, dependent: :destroy

  belongs_to :product_type, autosave: true
  
  validates :name, presence: true, uniqueness: true

  store_accessor :properties

  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => proc{ |attr| attr[:image_data].nil? }

  delegate :categories, :category, :type, :type_images, :to => :product_type, :prefix => false

  def thumbs
    self.images.map { |img| img.thumb }
  end

  def catalogue_image
    return Image.first.image_data_url.to_s if self.images.empty?
    return self.images.first.image_data_url.to_s if !self.images.empty?
  end

end