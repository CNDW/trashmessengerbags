class ProductType < ActiveRecord::Base
  has_many :products, autosave: true, dependent: :destroy
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :fields, class_name: "ProductField"
  validates :name, presence: true, uniqueness: true, format: /\A[\sa-z0-9]+\Z/i
  validates :category, presence: true, format: /\A[\sa-z0-9]+\Z/i
  validates :desc, format: /\A[\sa-z0-9,.?!@#$%^&*_-]+\Z/i
  accepts_nested_attributes_for :fields, allow_destroy: true
  
  def categories
    ProductType.distinct.pluck(:category)
  end

  def product_list
    self.products.map { |product| product.name }
  end

  def type
    self.name
  end

  def self.by_category #returns a hash of ProductCategory collections, sorted by categorization
    cats = {}
    ProductType.categories.each { |cat| cats.store(cat, ProductType.where(category: cat)) }
    return cats
  end

  def gallery
    Gallery.find_by(name: self.name)
  end
  
end
