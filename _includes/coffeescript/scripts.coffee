showWidth = ->
  document.title = "Mig Reyes " + $(window).width()

setupGallery = ->
  $height = Math.floor($(window).width() * 0.535)
  adjustPhotoSize $('.photos'), $height
  adjustPhotoSize $('.photos figure'), $height

adjustPhotoSize = (el, height) ->
  $el = $(el)
  $el.height height


$ ->
  setupGallery()

  $(window).resize ->
    setupGallery()

  $(window).scroll ->
    if $(window).width() >= 768
      if $(window).scrollTop() >= ($('#content').height() + 24)
        $('.photos').css 'overflow', 'scroll'
      else
        $('.photos').css 'overflow', 'visible'