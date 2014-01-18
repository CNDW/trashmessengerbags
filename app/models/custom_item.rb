class CustomItem < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :product_type
  belongs_to :product_model
  
end
