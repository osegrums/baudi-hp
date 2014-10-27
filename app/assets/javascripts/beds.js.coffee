# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  bedPrices = ->
    $('#purchase-form').data('bed-prices')

  kitPrices = ->
    $('#purchase-form').data('kit-prices')

  decorationPrices = ->
    $('#purchase-form').data('decoration-prices')

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

  findDecorationPrice = (dimensionId, hasRack) ->
    matches = $.grep decorationPrices(), (decPrice) ->
      decPrice['dimension_id'].toString() == dimensionId and
      decPrice['has_rack']                == hasRack
    matches[0]

  recalculatePrice = ->
    return unless $('#actual-price-price').length > 0
    hasRack       = $('#bp-has-rack').is(':checked')
    hasDecoration = $('#bp-has-decoration').is(':checked')
    dimensionId   = $('input:radio[name=dimension]:checked').val()
    kitId         = $('#bp-kit').val();
    bedPriceData  = findBedPrice(hasRack, hasDecoration, dimensionId)
    kitPriceData  = findKitPrice(kitId, dimensionId)
    decPriceData  = findDecorationPrice(dimensionId, hasRack)
    kitPrice      = parseFloat(if kitPriceData then kitPriceData['price'] else 0)
    decPrice      = if hasDecoration then parseFloat(if decPriceData then decPriceData['price'] else 0) else 0
    bedPrice      = parseFloat(if bedPriceData then bedPriceData['price'] - decPrice else 0)

    $('#bp-price-id').val(bedPriceData['id']) if bedPriceData
    $('#bed-price').html(bedPrice)

    $('#bp-kit-price-id').val(kitPriceData['id']) if kitPriceData
    $('#kit-price').html(kitPrice)

    $('#decoration-price').html(decPrice)
    $('#actual-price-price').html(bedPrice + kitPrice + decPrice)

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
    $radio = $(event.target)
    kitId = $radio.data('kit-id')
    kitDesc = $radio.data('kit-description')
    $('#bp-kit').val(kitId).trigger('change')

  if $('#purchase-form').length > 0
    recalculatePrice()
    setDimensionName()
    initColorPreview()

  $('.bp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.bp-color-changer').on 'click',  (event) -> changeColor(event)
  $('.bp-kit-changer').on   'click',  (event) -> changeKit(event)
  $('.bp-dimension').on     'click',  (event) -> setDimensionName()
