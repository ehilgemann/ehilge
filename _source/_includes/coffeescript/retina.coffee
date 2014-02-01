$ ->
  Retina = ->
    pixelRatio = (if !!window.devicePixelRatio then window.devicePixelRatio else 1)

    if pixelRatio > 1
      $('img').each ->
        $image = $(this)
        if $image.data 'retina' then $image.attr 'src', $image.data 'retina'


  Retina()