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


$ ->
  setupGallery()

  $(window).resize ->
    setupGallery()