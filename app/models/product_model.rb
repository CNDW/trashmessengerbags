class ProductModel < ActiveRecord::Base
  has_one :producttype
  validates :item_type, presence: true
end
