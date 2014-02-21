# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", ".add_category", ->
	category=prompt('Enter the category name', '')
	if category
		$(".new_product_category #product_type_category").append("<option value='" + category + "'>" + category + "</option>")

$(document).on "click", "form .remove_fields", (event) ->
	$(this).prev('input[type=hidden]').val(1)
	$(this).closest('fieldset').hide()
	event.preventDefault()

$(document).on "click", "form .add_fields", (event) ->
	time = new Date().getTime()
	regexp = new RegExp($(this).data('id'), 'g')
	$(this).before($(this).data('fields').replace(regexp, time))
	event.preventDefault()

$(document).on "click", ".option-type-selectall", ->
	$(".option-" + $(this).attr('id')).prop('checked', this.checked)

$(document).on "click", "#option_checkbox", ->
	checkboxes = "." + $(this).attr('class')
	check = ($(checkboxes + ":checked").length == $(checkboxes).length)
	$("#" + checkboxes.substr(-1) + ".option-type-selectall").prop('checked', check)