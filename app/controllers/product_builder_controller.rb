class ProductBuilderController < ApplicationController
  def index
    @products = Product.all
  end
  
  def start
    @line_item = Line_item.new
  end
  
  def next_step
  end

  def finish
  end
end
