jQuery ->
  $(document).on 'click', '[data-gallery]', (event) ->
    event.preventDefault()
    id = $(@).data('gallery')
    container = $(id)

    # Select all links with the same data-gallery attribute:
    links = $('[data-gallery="' + id + '"]')

    console.log links.length, links
    new blueimp.Gallery links,
      container: container,
      urlProperty: 'preview-url' # data-preview-url
      index: @,
      event: event
