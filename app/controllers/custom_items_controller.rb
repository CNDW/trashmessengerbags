class CustomItemsController < ApplicationController
  before_action :set_custom_item, only: [:show, :edit, :update, :destroy]
  
  # GET /custom_items
  # GET /custom_items.json
  def index
    @custom_items = CustomItem.all
    redirect_to new_custom_item_path
  end

  # GET /custom_items/1
  # GET /custom_items/1.json
  def show
  end

  # GET /custom_items/new
  def new
    #gon.categories = CustomItem.category_listing
    #gon.products = CustomItem.product_listing
    @custom_item = CustomItem.new
  end

  # GET /custom_items/1/edit
  def edit
  end

  # POST /custom_items
  # POST /custom_items.json
  def create
    @custom_item = CustomItem.new(custom_item_params)

    respond_to do |format|
      if @custom_item.save
        format.html { redirect_to custom_item_steps_path }
        cookies[:current_custom_item] = @custom_item.id
      else
        format.html { render action: 'new' }
        cookies.delete(:current_custom_item)
      end
    end
  end

  # PATCH/PUT /custom_items/1
  # PATCH/PUT /custom_items/1.json
  def update
    #@custom_item.product_options.clear
    #@custom_item.product_option_ids=params[:custom_item][:product_option_ids] 
    respond_to do |format|
      if @custom_item.update(custom_item_params)
        format.js
        format.html { redirect_to custom_items_url, notice: 'Custom item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_items.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_items/1
  # DELETE /custom_items/1.json
  def destroy
    @custom_item.destroy
    respond_to do |format|
      format.html { redirect_to custom_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_item
      @custom_item = CustomItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_item_params
      params.require(:custom_item).permit(:product_type_id, :category, :product_id)
    end
end
