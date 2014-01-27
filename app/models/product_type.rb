class ProductType < ActiveRecord::Base
  belongs_to :product_category, autosave: true
  has_many :custom_items, dependent: :nullify
  has_many :product_models, autosave: true, dependent: :restrict_with_error
  validates :product_category_id, presence: true
  
  def type_models
    self.product_models.collect { |model| model.name }
  end


end
