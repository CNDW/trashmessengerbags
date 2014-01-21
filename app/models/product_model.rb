class ProductModel < ActiveRecord::Base
  belongs_to :product_type
  has_many :custom_items
  has_many :product_options
  validates :product_type_id, presence: true
end
