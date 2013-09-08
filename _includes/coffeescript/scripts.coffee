showWidth = ->
  document.title = "Mig Reyes " + $(window).width()

setupGallery = ->
  $height = calculatePhotoHeight()
  setGallerySize $('.photos'), $height
  setGallerySize $('.photos figure'), $height

calculatePhotoHeight = ->
  Math.floor($(window).width() * 0.535)

setGallerySize = (el, height) ->
  $el = $(el)
  $el.height height

setGalleryOverflow = ->
  if $(window).width() >= 768
    $contentHeight = $('#content').height()
    $photoHeight = calculatePhotoHeight()
    $windowHeight = $(window).height()

    if $(window).scrollTop() >= ($contentHeight - ($windowHeight - $photoHeight))
      $('.photos').css 'overflow', 'scroll'
    else
      $('.photos').css 'overflow', 'visible'


$ ->
  setupGallery()

  $(window).resize ->
    setupGallery()

  $(window).scroll ->
    setGalleryOverflow()