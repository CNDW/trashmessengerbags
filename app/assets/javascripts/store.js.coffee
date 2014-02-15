# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$(".store-item").hide()
	$('.category-selector').first().click()

$(document).on "click", ".catalogue-button", (e)->
	e.preventDefault()
	$(".store-item").hide()
	$(".category-" + $(this).attr('id')).show()
