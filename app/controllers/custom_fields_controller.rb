class CustomFieldsController < SecureController
  before_action :set_custom_field, only: [:show, :update, :destroy]

  # GET /custom_fields
  # GET /custom_fields.json
  def index
    @custom_fields = CustomField.all
  end

  # GET /custom_fields/1
  # GET /custom_fields/1.json
  def show
  end

  # GET /custom_fields/new
  def new
    @custom_field = CustomField.new
  end

  # GET /custom_fields/1/edit
  def edit
  end

  # POST /custom_fields
  # POST /custom_fields.json
  def create
    @custom_field = CustomField.new(custom_field_params)

    respond_to do |format|
      if @custom_field.save
        format.html { redirect_to @custom_field, notice: 'Custom field was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custom_field }
      else
        format.html { render action: 'new' }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_fields/1
  # PATCH/PUT /custom_fields/1.json
  def update
    respond_to do |format|
      if @custom_field.update(custom_field_params)
        format.html { redirect_to @custom_field, notice: 'Custom field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_fields/1
  # DELETE /custom_fields/1.json
  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.html { redirect_to custom_fields_url }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    @custom_fields = CustomField.all.where(fieldable_id: params[:fieldable_id], fieldable_type: params[:fieldable_type])
    @parent = params[:fieldable_type].constantize.find(params[:fieldable_id])
  end

  def update_multiple
    CustomField.update_fields(custom_fields_params)
    redirect_to edit_product_url(1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_field
      @custom_field = CustomField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_field_params
      params.require(:custom_field).permit(:name, :field_type, :fieldable_id, :fieldable_type, :required, :show_public)
    end

    def custom_fields_params
      params.require(:custom_fields)
    end
end
