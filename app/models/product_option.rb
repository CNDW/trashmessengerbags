class ProductOption < ActiveRecord::Base
  belongs_to :product_model
  has_many :custom_items
  
  validates :product_model, presence: true
end
