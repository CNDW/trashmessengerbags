class ThumbnailColumn < TableCloth::Column
	#table_cloth uses element_factory to translate the collection variables into table data
	#table_data uses the data passed from the column.value method as an argument for ElementFactory::Element.new
	#A string is required to ensure everything plays nicely, passed through the raw method to bypass ElementFactory html filters
	def value(object, view, table=nil)
		view.raw(thumbs(object, view))
	end

	def thumbs(object, view)
		value = object.images.map { |img| view.image_tag(img.thumb) }.join if object.images
		value = view.image_tag(object.thumb) if object.is_a?(Image)
		return value
	end
end