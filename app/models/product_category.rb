class ProductCategory < ActiveRecord::Base
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :products, autosave: true, dependent: :destroy
  has_many :images, as: :imageable
  validates :name, presence: true, uniqueness: true, format: /\A[\sa-z0-9]+\Z/i
  validates :category, presence: true, format: /\A[\sa-z0-9]+\Z/i
  validates :desc, format: /\A[\sa-z0-9,.?!@#$%^&*_-]+\Z/i
  
  def category_name
    "#{self.name}"
  end
  
  def self.categories
    ProductCategory.all.map { |product| product.category }.uniq
  end

  def product_list
    self.products.map { |product| product.name }
  end
  
end
