class CustomItem < ActiveRecord::Base
  has_many :customizers, as: :customizable, dependent: :destroy
  has_many :options, through: :customizers, dependent: :destroy
  belongs_to :product
  validates :product_type_id, presence: true
  validates :product_id, presence: true

  def self.type_listing
  	ProductType.all.map { |cat| [cat.id, cat.category] }
  end

  def self.product_listing
  	Product.all.map { |product| [product.id, product.product_type_id, 1] }#need to change 1 for updated options
  end 
end
