class ImagesController < SecureController
  def index
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(image_params)

  	if @image.save
  		redirect_to images_path, notice: "The image #{@image.title} has been uploaded."
  	else
  		render "new"
  	end
  end

  def destroy
  	@image = Image.find(params[:id])
  	@image.destroy
  	redirect_to images_path, notice: "#{@image.title} has been deleted"
  end

  private
  	def image_params
  		params.require(:image).permit(:title, :desc, :image_data, :imagable_id, :imagable_type, :gallery_id)
  	end
end
