$ ->
	$(document).on "click", ".add_category", ->
		category=prompt('Enter the category name', '')
		if category
			$(".new_product #product_category").append("<option value='" + category + "'>" + category + "</option>")