class ProductCategory < ActiveRecord::Base
  has_many :product_types, autosave: true
  has_many :product_models, through: :product_type, autosave: true
  has_many :custom_items, autosave: true
  
  def category_name
    "#{self.name}"
  end
  
  def category_types
    self.product_types.collect { |type| type.name }
  end
  
end
