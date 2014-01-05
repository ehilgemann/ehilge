parallax = (element, direction, start, stop, rate) ->
  $(window).on 'scroll', ->
    position = document.body.scrollTop

    if position >= start and position <= stop
      element.css direction, ($(window).scrollTop() * rate)


publicServiceAnnouncement = ->
  $message = $('[data-psa]')
  resizeTimer = undefined
  mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  $(window).resize ->
    unless mobile
      # Show the message
      $message.fadeIn()

      # Reset old countdowns
      clearTimeout resizeTimer if resizeTimer

      # Start a new countdown
      resizeTimer = setTimeout(->
        resizeTimer = null
        $message.fadeOut()
      , 1200)


showWindowWidth = ->
  $(window).resize -> document.title = $(window).width()


escapable = ->
  $('[data-behavior="escapable"]').fadeOut()

$ ->
  $(window).bind 'keydown', (event) ->
    switch event.keyCode
      when 27 # Escape
        escapable()

  # publicServiceAnnouncement()