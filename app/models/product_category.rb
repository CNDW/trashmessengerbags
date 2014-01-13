class ProductCategory < ActiveRecord::Base
  has_many :producttype
  def category_name
    "#{self.name}"
  end
end
