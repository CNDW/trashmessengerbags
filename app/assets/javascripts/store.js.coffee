# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$(".col-store-item").hide()
	$('.category-selector').first().click()

$(document).on "click", ".catalogue-section-buttons .btn", (e)->
	e.preventDefault()
	$(".col-store-item").hide()
	$(".category-" + $(this).attr('id')).show()