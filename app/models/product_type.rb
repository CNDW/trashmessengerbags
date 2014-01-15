class ProductType < ActiveRecord::Base
  belongs_to :productcategory
  has_many :productmodel
  before_save :fetch_available_models
  validates :item_category, presence: true
  
  def fetch_available_models
    self.available_models = []
    ProductModel.all.each do |model|
      self.available_models_will_change!
      self.available_models << model.name if model.item_type == self.name
    end
  end
end
