class StoreController < ApplicationController
  def catalogue
  	@products_by_category = ProductType.by_categories
  end

  def premade
  end

  def custom
  end

  private
  	def locals(values)
  		render locals: values
  	end
end
