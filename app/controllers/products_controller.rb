#controller that will combine category, type, model, and option controllers for editing the product database
class ProductsController < SecureController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	#GET /products
	def index
		@products = Product.includes(:gallery_indices, :images, :product_type)
    @product_types = ProductType.all
	end

  #GET
	def new
		@product = Product.new(product_type_id: params[:product_type_id])
	end

  #GET
	def show
	end

  #GET	
	def edit
	end

	#PATCH/PUT
	def update
    @product.attributes = {'images_attributes' => {'gallery_ids' => []}, 'option_ids' => []}.merge(params[:product])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
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
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
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
			@product = Product.includes(:options, :images, :custom_fields).find(params[:id])
      @option_types = OptionType.includes(:options)
		end

		def product_params
      params.require(:product).permit(:name, :price, :product_type_id, option_ids: [], images_attributes: [:title, :image_data, :_destroy, :id, gallery_ids: []]).tap do |whitelist|
        whitelist[:properties] = params[:product][:properties]
      end
    end

end