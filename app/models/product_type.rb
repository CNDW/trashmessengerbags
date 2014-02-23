class ProductType < ActiveRecord::Base
  has_many :products, autosave: true, dependent: :destroy
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :custom_fields, as: :fieldable, dependent: :destroy

  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy

  validates :name, presence: true, uniqueness: true, format: /\A[\sa-z0-9]+\Z/i
  validates :category, presence: true, format: /\A[\sa-z0-9]+\Z/i
  validates :desc, format: /\A[\sa-z0-9,.?!@#$%^&*_-]+\Z/i
  
  def self.categories
    @categories ||= ProductType.distinct.pluck(:category)
  end

  #returns a hash of ProductType collections sorted by their category field, includes products and images on query to minimize hit to db
  def self.by_categories 
    types = {}
    ProductType.includes(:products, :images).find_each {|object| types.merge!({ object.category => [object] }) {|key, oldval, newval| oldval.concat(newval)}}
    return types
  end

  def type
    self.name
  end
  
  def type_images
    self.images
  end
  
end
