class StoreController < ApplicationController
  def catalogue
  	@products = ProductType.by_category
  end

  def premade
  end

  def custom
  end
  
end
