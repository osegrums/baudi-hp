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
    return unless $('#actual-price-price').length > 0
    hasDecoration  = $('#lp-has-decoration').is(':checked')
    dimensionId    = $('input:radio[name=dimension]:checked').val()
    kitId          = $('#lp-kit').val();
    linenPriceData = findLinenPrice(kitId, hasDecoration, dimensionId)
    decPriceData   = findDecorationPrice(dimensionId)
    linenPrice     = parseFloat(if linenPriceData then linenPriceData['price'] else 0)
    decPrice       = if hasDecoration then parseFloat(if decPriceData then decPriceData['price'] else 0) else 0

    $('#decoration-price').html(decPrice)

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
