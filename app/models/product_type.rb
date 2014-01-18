class ProductType < ActiveRecord::Base
  belongs_to :product_category
  has_many :custom_items
  has_many :product_models, autosave: true
  validates :product_category_id, presence: true
  
  def type_models
    self.product_models.collect { |model| model.name }
  end
end
