class ProductTypesController < SecureController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /product_categories
  # GET /product_categories.json
  def index
    @product_types = ProductType.all
  end

  # GET /product_categories/1
  # GET /product_categories/1.json
  def show
  end

  # GET /product_categories/new
  def new
    @product_type = ProductType.new
  end

  # GET /product_categories/1/edit
  def edit
  end

  # POST /product_categories
  # POST /product_categories.json
  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to product_types_url, notice: 'Product type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_categories/1
  # PATCH/PUT /product_categories/1.json
  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        format.html { redirect_to product_types_url, notice: 'Product type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.json
  def destroy
    @product_type.destroy
    respond_to do |format|
      format.html { redirect_to product_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :price, :desc, :category, fields_attributes: [:name, :product_type_id, :field_type, :required, :_destroy, :id])
    end
end
