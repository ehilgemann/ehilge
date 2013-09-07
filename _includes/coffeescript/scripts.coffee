showWidth = ->
  document.title = "Mig Reyes " + $(window).width()

resizePhotosHeight = ->
  adjustPhotoHeight $('.photos')
  adjustPhotoHeight $('.photos figure')

adjustPhotoHeight = (el) ->
  $el = $(el)
  $el.height Math.floor($(window).width() * 0.54)


$ ->
  resizePhotosHeight()

  $(window).resize ->
    resizePhotosHeight()