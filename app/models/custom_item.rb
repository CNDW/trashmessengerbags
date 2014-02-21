class CustomItem < ActiveRecord::Base
  has_many :customizers, as: :customizable, dependent: :destroy
  has_many :options, through: :customizers, dependent: :destroy
  belongs_to :product, autosave: true
  belongs_to :product_type, autosave: true

  def type
  	return "none" if self.product_type.nil?
  	self.product_type.name
  end

  def name
  	return "none" if self.product.nil?
  	self.product.name
  end

end
