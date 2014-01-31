class ProductCategory < ActiveRecord::Base
  has_many :product_types, autosave: true, dependent: :restrict_with_error
  has_many :product_models, through: :product_type, autosave: true
  has_many :custom_items, autosave: true, dependent: :nullify
  has_many :products, autosave: true, dependent: :destroy
  has_many :images, as: :imageable
  validates :name, presence: true, uniqueness: true
  
  def category_name
    "#{self.name}"
  end
  
  def category_types
    # deprecated self.product_types.collect { |type| type.name }
    self.name
  end
  
end
