class ProductModel < ActiveRecord::Base
  belongs_to :producttype
  validates :item_type, presence: true
end
