class Product < ActiveRecord::Base
	has_many :images, as: :imageable
  accepts_nested_attributes_for :images
  has_many :custom_items, autosave: true, dependent: :nullify
  belongs_to :product_category, autosave: true
  has_and_belongs_to_many :product_options, join_table: "options_products", autosave: true
  validates :name, presence: true, uniqueness: true

  def self.categories
  	cats = Product.all.map { |product| product.category }.uniq
  	cats.delete_if { |cat| cat.empty? }
  end

  def option_list
    self.product_options.map { |option| option.name }
  end

end