class ProductCategory < ActiveRecord::Base
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :products, autosave: true, dependent: :destroy
  has_many :images, as: :imageable
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  
  def category_name
    "#{self.name}"
  end
  
  def self.categories
    ProductCategory.all.map { |product| product.category }.uniq
  end
  
end
