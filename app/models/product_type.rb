class ProductType < ActiveRecord::Base
  belongs_to :productcategory
  validates :item_category, presence: true
end
