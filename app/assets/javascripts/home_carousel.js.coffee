# https://github.com/SSilence/simple.carousel

jQuery ->
  container = $('#home-carousel')
  if container
    container.html('')
    container.append('<ul id="carousel" style="padding: 0; margin: 0">')
    ulContainer = container.find('ul')
    $.each ['01', '02', '03', '04'], (n, name) ->
       ulContainer.append('<li><img src="/images/slider/' + name + '.jpg" /></li>')

    $("#carousel").simplecarousel
      slidespeed: 400,
      auto: 7000,
      width: 874,
      height: 369
