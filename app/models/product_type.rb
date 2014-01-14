class ProductType < ActiveRecord::Base
  belongs_to :productcategory
  has_many :productmodel
  validates :item_category, presence: true
end
