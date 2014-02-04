$ ->
  Retina = ->
    pixelRatio = (if !!window.devicePixelRatio then window.devicePixelRatio else 1)

    if pixelRatio > 1
      $images = $('[data-retina]')
      $images.each ->
        $image = $(@)
        $image.attr 'src', $image.data 'retina'

  Retina()
