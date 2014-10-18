# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  bedPrices = ->
    $('#purchase-form').data('bed-prices')

  kitPrices = ->
    $('#purchase-form').data('kit-prices')

  findBedPrice = (hasRack, hasDecoration, dimensionId) ->
    matches = $.grep bedPrices(), (bedPrice) ->
      bedPrice['has_rack']                == hasRack and
      bedPrice['has_decoration']          == hasDecoration and
      bedPrice['dimension_id'].toString() == dimensionId
    matches[0]

  findKitPrice = (kitId, dimensionId) ->
    matches = $.grep kitPrices(), (kitPrice) ->
      kitPrice['kit_id'].toString()       == kitId and
      kitPrice['dimension_id'].toString() == dimensionId
    matches[0]

  recalculatePrice = ->
    return unless $('#actual-price-price').length > 0
    hasRack       = $('#bp-has-rack').is(':checked')
    hasDecoration = $('#bp-has-decoration').is(':checked')
    dimensionId   = $('input:radio[name=dimension]:checked').val()
    kitId         = $('#bp-kit').val();
    bedPriceData  = findBedPrice(hasRack, hasDecoration, dimensionId)
    kitPriceData  = findKitPrice(kitId, dimensionId)
    bedPrice      = parseFloat(if bedPriceData then bedPriceData['price'] else 0)
    kitPrice      = parseFloat(if kitPriceData then kitPriceData['price'] else 0)

    $('#bp-price-id').val(bedPriceData['id']) if bedPriceData
    $('#bed-price').html(bedPrice)

    $('#bp-kit-price-id').val(kitPriceData['id']) if kitPriceData
    $('#kit-price').html(kitPrice)

    $('#actual-price-price').html(bedPrice + kitPrice)

  setDimensionName = ->
    name = $('input[name=dimension]:checked').data('name')
    $('#selected-dimension-name').html(name)

  changeColor = (event) ->
    event.preventDefault()
    $link = $(event.target)
    $link = $link.closest('a') if $link.prop('tagName') == 'IMG'
    colorId = $link.data('color-id')
    colorName = $link.data('color-name')
    $('#bp-color').val(colorId)
    $('.color-selected').removeClass('color-selected')
    $link.addClass('color-selected')
    $('#selected-color-name').html(colorName)

  changeKit = (event) ->
    event.preventDefault()
    $link = $(event.target)
    $link = $link.closest('a') if $link.prop('tagName') == 'IMG'
    kitId = $link.data('kit-id')
    kitDesc = $link.data('kit-description')
    $('#bp-kit').val(kitId).trigger('change')
    $('.kit-selected').removeClass('kit-selected')
    $link.addClass('kit-selected')
    $('#selected-kit-description').html(kitDesc)

  if $('#purchase-form').length > 0
    recalculatePrice()
    setDimensionName()

  $('.bp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.bp-color-changer').on 'click',  (event) -> changeColor(event)
  $('.bp-kit-changer').on   'click',  (event) -> changeKit(event)
  $('.bp-dimension').on     'click',  (event) -> setDimensionName()
