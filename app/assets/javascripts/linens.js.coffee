jQuery ->
  linenPrices = ->
    $('#linen-purchase-form').data('linen-prices')

  findLinenPrice = (kitId, dimensionId) ->
    matches = $.grep linenPrices(), (linenPrice) ->
      linenPrice['kit_id'].toString()       == kitId and
      linenPrice['dimension_id'].toString() == dimensionId
    matches[0]

  recalculatePrice = ->
    return unless $('#actual-price-price').length > 0
    dimensionId    = $('input:radio[name=dimension]:checked').val()
    kitId          = $('#lp-kit').val();
    linenPriceData = findLinenPrice(kitId, dimensionId)
    linenPrice     = parseFloat(if linenPriceData then linenPriceData['price'] else 0)

    console.log dimensionId, kitId, linenPrice, linenPriceData

    $('#lp-price-id').val(linenPriceData['id']) if linenPriceData
    $('#actual-price-price').html(linenPrice)

  setDimensionName = ->
    name = $('input[name=dimension]:checked').data('name')
    $('#selected-dimension-name').html(name)

  changeKit = (event) ->
    $radio = $(event.target)
    kitId = $radio.data('kit-id')
    kitDesc = $radio.data('kit-description')
    $('#lp-kit').val(kitId).trigger('change')
    $('#kit-description').text(kitDesc)

  if $('#linen-purchase-form').length > 0
    recalculatePrice()
    setDimensionName()

  $('.lp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.lp-kit-changer').on   'click',  (event) -> changeKit(event)
  $('.lp-dimension').on     'click',  (event) -> setDimensionName()
