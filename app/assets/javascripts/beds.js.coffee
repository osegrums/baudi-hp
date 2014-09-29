# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  prices = ->
    $('#purchase-form').data('bed-prices')

  findBedPrice = (hasRack, hasDecoration, dimensionId, kitId) ->
    matches = $.grep prices(), (bedPrice) ->
      bedPrice['has_rack']                == hasRack and
      bedPrice['has_decoration']          == hasDecoration and
      bedPrice['dimension_id'].toString() == dimensionId and
      bedPrice['kit_id'].toString()       == kitId
    matches[0]

  recalculatePrice = ->
    hasRack       = $('#bp-has-rack').is(':checked')
    hasDecoration = $('#bp-has-decoration').is(':checked')
    dimensionId   = $('input:radio[name=dimension]:checked').val();
    kitId         = $('#bp-kit').val();
    bedPrice      = findBedPrice(hasRack, hasDecoration, dimensionId, kitId)
    if bedPrice
      $('#bp-price-id').val(bedPrice['id'])
      $('#actual-price-price').html(bedPrice['price'])

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
    $('.bp-color-selected').removeClass('bp-color-selected')
    $link.addClass('bp-color-selected')
    $('#selected-color-name').html(colorName)

  changeKit = (event) ->
    event.preventDefault()
    $link = $(event.target)
    $link = $link.closest('a') if $link.prop('tagName') == 'IMG'
    kitId = $link.data('kit-id')
    kitDesc = $link.data('kit-description')
    $('#bp-kit').val(kitId).trigger('change')
    $('.bp-kit-selected').removeClass('bp-kit-selected')
    $link.addClass('bp-kit-selected')
    $('#selected-kit-description').html(kitDesc)

  if $('#purchase-form').length > 0
    recalculatePrice()
    setDimensionName()

  $('.bp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.bp-color-changer').on 'click',  (event) -> changeColor(event)
  $('.bp-kit-changer').on   'click',  (event) -> changeKit(event)
  $('.bp-dimension').on     'click',  (event) -> setDimensionName()
