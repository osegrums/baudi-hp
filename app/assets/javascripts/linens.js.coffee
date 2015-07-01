jQuery ->
  linenPrices = ->
    $('#linen-purchase-form').data('linen-prices')

  decorationPrices = ->
    $('#linen-purchase-form').data('decoration-prices')

  findLinenPrice = (kitId, hasDecoration, dimensionId) ->
    matches = $.grep linenPrices(), (linenPrice) ->
      linenPrice['has_decoration']          == hasDecoration and
      linenPrice['kit_id'].toString()       == kitId and
      linenPrice['dimension_id'].toString() == dimensionId
    matches[0]

  findDecorationPrice = (dimensionId) ->
    matches = $.grep decorationPrices(), (decPrice) ->
      decPrice['dimension_id'].toString() == dimensionId
    matches[0]

  recalculatePrice = ->
    # return unless $('#actual-price-price').length > 0
    hasDecoration  = $('#lp-has-decoration').is(':checked')
    dimensionId    = $('input:radio[name=dimension]:checked').val()
    kitId          = $('#lp-kit').val();
    totalPriceData = findLinenPrice(kitId, hasDecoration, dimensionId)
    decPriceData   = findDecorationPrice(dimensionId)
    totalPrice     = parseFloat(if totalPriceData then totalPriceData['price'] else 0)
    decPrice       = if hasDecoration then parseFloat(if decPriceData then decPriceData['price'] else 0) else 0
    linenPrice     = totalPrice - decPrice

    $('#decoration-price').html(decPrice)
    $('#linen-price').html(linenPrice)

    $('#lp-price-id').val(totalPriceData['id']) if totalPriceData
    $('#actual-price-price').html(totalPrice)


  setDimensionName = ->
    name = $('input[name=dimension]:checked').data('name')
    $('#selected-dimension-name').html(name)

  changeKit = (event) ->
    $radio = $(event.target)
    kitId = $radio.data('kit-id')
    kitDesc = $radio.data('kit-description')
    $('#lp-kit').val(kitId).trigger('change')

  if $('#linen-purchase-form').length > 0
    recalculatePrice()
    setDimensionName()

  $('.lp-changer').on       'change', (event) -> recalculatePrice(event)
  $('.lp-kit-changer').on   'click',  (event) -> changeKit(event)
  $('.lp-dimension').on     'click',  (event) -> setDimensionName()
