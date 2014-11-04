# https://github.com/Phifo/blueimp-gallery
# http://blueimp.github.io/Gallery/

jQuery ->
  container = document.getElementById("gridContainer")
  if container
    container.onclick = (event) ->
      event = event or window.event
      event.preventDefault()
      target = event.target or event.srcElement
      link = (if target.src then target.parentNode else target)
      options =
        index: link
        event: event

      links = @getElementsByTagName("a")
      blueimp.Gallery links, options
