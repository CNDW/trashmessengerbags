class StoreController < ApplicationController
  def catalogue
  	@products = ProductCategory.by_category
  end

  def premade
  end

  def custom
  end
  
end
