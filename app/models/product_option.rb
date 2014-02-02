class ProductOption < ActiveRecord::Base
  has_and_belongs_to_many :products, join_table: "options_products", autosave: true
  has_and_belongs_to_many :custom_items, autosave: true

  def product_list
  	self.products.map { |product| product.name }
  end
  
end
