# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  recalculatePrice = (event) ->
    console.log 'shiiiiiiiiit'

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

  $('.bp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.bp-color-changer').on 'click',  (event) -> changeColor(event)
  $('.bp-kit-changer').on   'click',  (event) -> changeKit(event)
