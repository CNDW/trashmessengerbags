class ProductCategory < ActiveRecord::Base
  has_many :producttype
  has_many :productmodel, through: :producttype
  before_save :fetch_available_types
  def category_name
    "#{self.name}"
  end
  
  def fetch_available_types
    self.available_types = []
    ProductType.all.each do |type|
      self.available_types_will_change!
      self.available_types << type.name if type.item_category == self.name
    end
  end
end
