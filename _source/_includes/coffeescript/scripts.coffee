parallax = (element, direction, start, stop, rate) ->
  $(window).scroll ->
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
  $('[data-escapable]').fadeOut()


$ ->
  $(window).bind 'keydown', (event) ->
    switch event.keyCode
      when 27 then escapable()

  $parallaxable = $('[data-parallax]')
  $parallaxable.each ->
    $this = $(this)
    $direction = $this.data('parallax-direction')
    $start = $this.data('parallax-start')
    $stop = $this.data('parallax-stop')
    $rate = $this.data('parallax-rate')
    console.log $this
    console.log $direction
    console.log $start
    console.log $stop
    console.log $rate
    parallax $this, $direction, $start, $stop, $rate

  # publicServiceAnnouncement()
