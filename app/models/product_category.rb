class ProductCategory < ActiveRecord::Base
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :products, autosave: true, dependent: :destroy
  validates :name, presence: true, uniqueness: true, format: /\A[\sa-z0-9]+\Z/i
  validates :category, presence: true, format: /\A[\sa-z0-9]+\Z/i
  validates :desc, format: /\A[\sa-z0-9,.?!@#$%^&*_-]+\Z/i
  
  def self.categories
    ProductCategory.all.map { |product| product.category }.uniq
  end

  def product_list
    self.products.map { |product| product.name }
  end

  def self.by_category #returns a hash of ProductCategory collections, sorted by categorization
    cats = {}
    ProductCategory.categories.each { |cat| cats.store(cat, ProductCategory.where(category: cat)) }
    return cats
  end

  def gallery
    Gallery.find_by(name: self.name)
  end
  
end
