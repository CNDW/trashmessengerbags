class ImagesController < SecureController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  def index
  	@images = Image.all
    @galleries = Gallery.all
  end

  def new
  	@image = Image.new
  end

  def edit
  end

  def update
    @image.attributes = {'gallery_ids' => []}.merge(params[:image] || {})
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to images_path, notice: 'image category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
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
    def set_image
      @image = Image.find(params[:id])
    end
  	def image_params
  		params.require(:image).permit(:name, :title, :desc, :image_data, galleries_attributes: [:name, :title, :desc, :slideshow], gallery_ids: [])
  	end
end
