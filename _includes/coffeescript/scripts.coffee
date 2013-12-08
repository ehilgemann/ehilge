responsiveTest = ->
  $(window).resize ->
     document.title = $(window).width()

responsivePSA = ->
  $message = $('aside.public-service-announcement')
  resizeTimer = undefined

  $(window).resize ->
    unless /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
      $message.fadeIn()

      # Reset any old countdowns
      clearTimeout resizeTimer if resizeTimer

      # Start a new countdown
      resizeTimer = setTimeout(->
        resizeTimer = null
        $message.fadeOut()
      , 1200)

escapable = -> $('[data-behavior~="escapable"]').fadeOut()

$ ->
  $(window).bind 'keydown', (event) ->
    switch event.keyCode
      when 27 # Escape
        escapable()
        closeProject()

  # responsivePSA()
  # responsiveTest()