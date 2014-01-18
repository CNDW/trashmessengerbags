class ProductModel < ActiveRecord::Base
  belongs_to :product_type
  has_many :custom_items
  validates :product_type_id, presence: true
end
