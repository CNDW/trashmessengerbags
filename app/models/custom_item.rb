class CustomItem < ActiveRecord::Base
  has_many :options, as: :customizable, dependent: :destroy
  has_many :sizes, through: :options, autosave: true
  has_many :colors, through: :options, autosave: true
  has_many :extras, through: :options, autosave: true
  belongs_to :product_category
  belongs_to :product
  validates :product_category_id, presence: true
  validates :product_id, presence: true

  def self.category_listing
  	ProductCategory.all.map { |cat| [cat.id, cat.category] }
  end

  def self.product_listing
  	Product.all.map { |product| [product.id, product.product_category_id, 1] }#need to change 1 for updated options
  end 
end
