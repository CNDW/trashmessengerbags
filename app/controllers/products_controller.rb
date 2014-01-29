#controller that will combine category, type, model, and option controllers for editing the product database
class ProductsController < SecureController

	#GET /products
	def index
		@products = { categories: ProductCategory.all, types: ProductType.all, 
			models: ProductModel.all, options: ProductOption.all }
	end

	private
		def product_params
      params.permit! #permit all for now, while the views are being fleshed out.
    end
end