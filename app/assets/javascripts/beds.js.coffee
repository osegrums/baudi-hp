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

  changeColor = (event) ->
    event.preventDefault()
    $link = $(event.target)
    colorId = $link.data('color-id')
    $('#bp-color').val(colorId)
    $('.bp-color-selected').removeClass('bp-color-selected')
    $link.addClass('bp-color-selected')

  changeKit = (event) ->
    event.preventDefault()
    $link = $(event.target)
    kitId = $link.data('kit-id')
    $('#bp-kit').val(kitId).trigger('change')
    $('.bp-kit-selected').removeClass('bp-kit-selected')
    $link.addClass('bp-kit-selected')

  recalculatePrice() if $('#purchase-form').length > 0

  $('.bp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.bp-color-changer').on 'click',  (event) -> changeColor(event)
  $('.bp-kit-changer').on   'click',  (event) -> changeKit(event)
