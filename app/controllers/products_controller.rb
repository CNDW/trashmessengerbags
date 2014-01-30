#controller that will combine category, type, model, and option controllers for editing the product database
class ProductsController < SecureController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	#GET /products
	def index
		@prods = Product.all
		@products = { categories: ProductCategory.all, types: ProductType.all, 
			models: ProductModel.all, options: ProductOption.all }
	end

  #GET
	def new
		@product = Product.new
	end

  #GET
	def show
	end

  #GET	
	def edit
	end

	#PATCH/PUT
	def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
	end

	#POST
	def create
		@product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
	end

	#DELETE
	def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
      params.require(:product).permit(:name, :price, :description, :category, :prod_type)
    end
end