class ProductOption < ActiveRecord::Base
  has_and_belongs_to_many :products, join_table: "options_products", autosave: true
  has_and_belongs_to_many :custom_items, autosave: true
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices
  has_many :galleries, through: :gallery_indices

  def product_list
  	self.products.map { |product| product.name }
  end
  
end
