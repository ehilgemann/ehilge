escapable = -> $('[data-behavior~="escapable"]').fadeOut()

$ ->
  $(window).on 'resize', ->
     document.title = $(window).width()

  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    switch event.keyCode
      when 27 # Escape
        escapable()