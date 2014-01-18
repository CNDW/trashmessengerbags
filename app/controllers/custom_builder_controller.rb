class CustomBuilderController < ApplicationController
  
  def index
    @line_item = LineItem.new
  end
  
  def create
    @line_item = LineItem.new(line_item_params)
    
    respond_to do |format|
      if @line_item.save
        format.js
        #format.html { redirect_to @line_item, notice: 'Product was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @product }
      else
        format.js
        #format.html { render action: 'new' }
        #format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:item_category, :item_type, :item_model)
    end
end
