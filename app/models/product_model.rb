class ProductModel < ActiveRecord::Base
  belongs_to :product_type
  validates :product_type_id, presence: true
end
