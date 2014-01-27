class CustomItem < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :product_type
  belongs_to :product_model
  has_and_belongs_to_many :product_options
  validates :product_category_id, presence: true
  validates :product_type_id, presence: true
  validates :product_model_id, presence: true

  def self.type_listing
  	ProductType.all.map { |type| [type[:id], type[:product_category_id]] }
  end

  def self.model_listing
  	ProductModel.all.map { |model| [model[:id], model[:product_type_id], model.product_option_ids] }
  end
  
end
