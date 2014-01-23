class CustomItem < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :product_type
  belongs_to :product_model
  belongs_to :product_option
  validates :product_category_id, presence: true
  validates :product_type_id, presence: true
  validates :product_model_id, presence: true
  
end
