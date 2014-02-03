# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

categoryRadio = ".custom_product .category input[type=radio]" #ProductCategory.category radio button, Main category selection
typeRadio = ".custom_product .type input[type=radio]" #ProductCategory.category_id radio button, Sub category selection
modelRadio = ".custom_product .model input[type=radio]" #Product.product_id radio button, Product selection

# button = button to change, parentButton = selected button, itemArray = options for button
radioButtonChange = (button, parentButton, itemArray)->
    $(".custom_product .model").hide()
    $(".custom_product .submit").hide()
    $(".custom_product .options").hide()
    $($(button).parent()).hide() 
    $(button + ":checked").attr('checked', false)
    value = $(parentButton + ":checked").val()
    value = Number(value) unless parentButton is categoryRadio 
    itemArray.forEach (item)->
        if (item[1] == value)
            $(button + "[value=" + item[0] + "]").show()
            $(button + "[value=" + item[0] + "] + label").show()
            $($(button).parent()).show() if $($(button).parent()).is(":hidden")
        if (item[1] != value)
            $(button + "[value=" + item[0] + "]").hide()
            $(button + "[value=" + item[0] + "] + label").hide()
   
$(document).on "click", categoryRadio, ->
    radioButtonChange(typeRadio, categoryRadio, gon.categories)

$(document).on "click", typeRadio, ->
    radioButtonChange(modelRadio, typeRadio, gon.products)

$(document).on "click", modelRadio, ->
    $(".custom_product .options").hide()
    $(".custom_product .submit").show()
    value = Number($(modelRadio + ":checked").val())
    options = new Array()
    gon.products.forEach (product)->
        options = product[2] if product[0] is value
    $(".custom_product .options input[type=checkbox]").each ->
        $(this).prop('checked', false)
        if ($.inArray(Number($(this).val()), options) != -1)
            $(".custom_product .options").show() if $(".custom_product .options").is(":hidden")
            $(this).show()
            $(".custom_product .options label[for=" + $(this).attr('id') + "]").show()
        else
            $(this).hide()
            $(".custom_product .options label[for=" + $(this).attr('id') + "]").hide()








 
