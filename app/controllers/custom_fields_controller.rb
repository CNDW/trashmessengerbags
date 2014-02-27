class CustomFieldsController < SecureController
  before_action :set_custom_field, only: [:show, :update, :destroy]

  # GET /custom_fields
  # GET /custom_fields.json
  def index
    @custom_fields = CustomField.all
  end

  # DELETE /custom_fields/1
  # DELETE /custom_fields/1.json
  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to custom_fields_url }
    end
  end

  def edit_multiple
    @custom_fields = CustomField.all.where(fieldable_id: params[:fieldable_id], fieldable_type: params[:fieldable_type])
    @parent = params[:fieldable_type].constantize.find(params[:fieldable_id])
  end

  def update_multiple
    CustomField.update_fields(custom_fields_params) if params[:custom_fields]
    redirect_to params[:parent_url]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_field
      @custom_field = CustomField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_field_params
      params.require(:custom_field).permit(:name, :field_type, :fieldable_id, :fieldable_type, :required, :catalogue, :custom_shop, :in_stock)
    end

    def custom_fields_params
      params.require(:custom_fields)
    end
end
