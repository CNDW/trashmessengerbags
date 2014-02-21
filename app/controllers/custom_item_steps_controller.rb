class CustomItemStepsController < ApplicationController
	include Wicked::Wizard
	before_action :set_custom_item, only: [:show, :edit, :update, :destroy]
	steps :type, :model, :options

	def show
		render_wizard
	end

	def update
		@custom_item.attributes = custom_item_params
		render_wizard @custom_item
	end

	private

		def set_custom_item
			@custom_item = CustomItem.find(cookies[:current_custom_item])
		end

		def custom_item_params
      params.require(:custom_item).permit(:product_type_id, :category, :product_id)
    end
end
