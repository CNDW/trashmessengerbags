class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy
  has_many :galleries, through: :gallery_indices, dependent: :destroy
  has_many :customizers, as: :customizable, dependent: :destroy
  has_many :options, through: :customizers, dependent: :destroy
  has_many :custom_items, autosave: true, dependent: :nullify

  belongs_to :product_type, autosave: true
  
  validates :name, presence: true, uniqueness: true
  validate :validate_properties

  store_accessor :properties

  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => proc{ |attr| attr[:image_data].nil? }

  def validate_properties
    product_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end

  def option_list#need to update for new option structure
  end

  def thumbs
    self.images.map { |img| img.thumb }
  end

  def categorization
    self.product_type.category
  end

  def catalogue_image
    return Image.first.image_data_url.to_s if self.images.empty?
    return self.images.first.image_data_url.to_s if !self.images.empty?
  end

end