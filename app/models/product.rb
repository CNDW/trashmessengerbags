class Product < ActiveRecord::Base
  validates :name, :desc, :item_type, :price, :item_model, :item_category, presence: true
  before_create do
    self.pid = 5.times.map{Random.rand(0..9)}.join #todo: add safeguard to ensure unique pid
  end
end
