class Product < ActiveRecord::Base
	has_many :images, as: :imageable
  has_many :custom_items, autosave: true, dependent: :nullify
  belongs_to :product_category, autosave: true
  has_and_belongs_to_many :product_options, join_table: "options_products", autosave: true
  validates :name, presence: true, uniqueness: true

  def self.categories
  	cats = Product.all.map { |product| product.category }.uniq
  	cats.delete_if { |cat| cat.empty? }
  end

  def self.prod_types
  	prod_types = Product.all.map { |product| product.prod_type }.uniq
  	prod_types.delete_if { |type| type.empty? }
  end
end