class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy, autosave: true
  has_many :images, through: :gallery_indices, autosave: true
  has_many :galleries, through: :gallery_indices
  has_many :custom_items, autosave: true, dependent: :nullify
  has_and_belongs_to_many :product_options, join_table: "options_products", autosave: true
  belongs_to :product_category, autosave: true
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  def self.categories
  	cats = Product.all.map { |product| product.category }.uniq
  	cats.delete_if { |cat| cat.empty? }
  end

  def option_list
    self.product_options.map { |option| option.name }
  end

end