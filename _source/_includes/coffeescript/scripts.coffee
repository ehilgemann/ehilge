parallax = (element, direction, start, stop, rate) ->
  $(window).scroll ->
    position = document.body.scrollTop

    if position >= start and position <= stop
      element.css direction, ($(window).scrollTop() * rate)


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
    parallax $this, $direction, $start, $stop, $rate


  $("#wanker").wanker(duration: 1000)
