$ ->
	$(document).on "click", ".add_category", ->
		category=prompt('Enter the category name', '')
		if category
			$(".new_product #product_category").append("<option value='" + category + "'>" + category + "</option>")
$ ->
	$(document).on "click", ".add_type", ->
		type=prompt('Enter the type name', '')
		if type
			$(".new_product #product_prod_type").append("<option value='" + type + "'>" + type + "</option>")