class ProductModel < ActiveRecord::Base
  belongs_to :product_type
  has_many :custom_items
  has_and_belongs_to_many :product_options, join_table: "product_models_options", autosave: true
  validates :product_type_id, presence: true
end
