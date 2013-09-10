$currentPhoto = 1

showWidth = ->
  document.title = "Mig Reyes " + $(window).width()

Test = ->
  fun: ->
    console.log "Fun!"

setupGallery = ->
  $gallery = $('.gallery')
  $photos = $gallery.find('figure')
  $height = getHeight()
  $photoPosition = 0

  setHeight $gallery, $height
  setHeight $photos, $height

  $photos.each ->
    $(this).css
      left: $photoPosition
      width: $(window).width()
    $photoPosition += $(window).width()

getHeight = ->
  Math.floor($(window).width() * 0.535)

setHeight = (el, height) ->
  $el = $(el)
  $el.height height

nextPhoto = ->
  $gallery = $('.photos')
  distance = $(window).width() * $currentPhoto
  $currentPhoto += 1

  if $currentPhoto > $gallery.find('figure').length
    $gallery.animate
      left: "0"
    , 500
    $currentPhoto = 1
  else
    $gallery.animate
      left: -distance
    , 500

previousPhoto = ->
  $gallery = $('.photos')
  $lastPhoto = $gallery.find('figure').length
  $currentPhoto -= 1

  if $currentPhoto < 1
    distance = $(window).width() * ($lastPhoto - 1)
    $gallery.animate
      left: -distance
    , 500
    $currentPhoto = $lastPhoto
  else
    distance = $(window).width() * ($currentPhoto - 1)
    $gallery.animate
      left: -distance
    , 500


$ ->
  setupGallery()

  $(window).resize ->
    setupGallery()

  $('[data-photo~="next"]').on "click", ->
    nextPhoto()

  $('[data-photo~="previous"]').on "click", ->
    previousPhoto()

  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    switch event.keyCode
      when 37 # Left
        previousPhoto()
      when 39 # Right
        nextPhoto()