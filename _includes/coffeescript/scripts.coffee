escapable = -> $('[data-behavior~="escapable"]').fadeOut()

$ ->
  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    switch event.keyCode
      when 27 # Escape
        escapable()