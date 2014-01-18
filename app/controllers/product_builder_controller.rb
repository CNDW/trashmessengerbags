class ProductBuilderController < ApplicationController
  def index
    @products = Product.all
    @product_categories = ProductCategory.all
  end
  
  def start
  end
  
  def next_step
  end

  def finish
  end
end
