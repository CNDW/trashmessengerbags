class ProductOption < ActiveRecord::Base
  has_and_belongs_to_many :product_models, join_table: "product_models_options", autosave: true
  has_many :custom_items
  
end
