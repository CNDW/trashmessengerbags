# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
append_category = ->
	category=prompt('Enter the category name', '')
	if category
		$(".new_product_category #product_category_category").append("<option value='" + category + "'>" + category + "</option>")

$(document).on "click", ".add_category", append_category