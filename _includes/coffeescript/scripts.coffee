responsivePSA = ->
  $message = $('aside.responsive')
  resizeTimer = undefined

  $(window).resize ->
    # If more than 500ms has passed…
    $message.one().fadeIn()

    # Reset any old countdowns
    clearTimeout resizeTimer if resizeTimer

    # Start a new countdown
    resizeTimer = setTimeout(->
      resizeTimer = null
      $message.fadeOut()
    , 1200)

escapable = -> $('[data-behavior~="escapable"]').fadeOut()

$ ->
  $(window).resize ->
     document.title = $(window).width()

  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    switch event.keyCode
      when 27 # Escape
        escapable()

  # responsivePSA()