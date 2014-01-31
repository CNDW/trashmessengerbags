class CustomItem < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :product
  has_and_belongs_to_many :product_options
  validates :product_category_id, presence: true
  validates :product_id, presence: true

  def self.category_listing
  	ProductCategory.all.map { |cat| [cat.id, cat.category] }
  end

  def self.product_listing
  	Product.all.map { |product| [product.id, product.product_category_id, product.product_option_ids] }
  end
  
end
