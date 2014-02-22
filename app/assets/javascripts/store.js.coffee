# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$(".store-item").hide()
	$('.type-selector').first().click()

$(document).on "click", ".type-selector", (e)->
	e.preventDefault()
	$(".store-item").hide()
	$(".type-" + $(this).attr('id')).show()
