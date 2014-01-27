class ProductModel < ActiveRecord::Base
  belongs_to :product_type, autosave: true
  has_many :custom_items, dependent: :nullify
  has_and_belongs_to_many :product_options, join_table: "product_models_options", autosave: true
  validates :product_type_id, presence: true
end
