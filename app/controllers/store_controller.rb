class StoreController < ApplicationController
  def catalogue
  	@products = ProductType.includes(products: [:images, :galleries])
  	@categories = ProductType.distinct.pluck(:category)
  end

  def premade
  end

  def custom
  end
  
end
