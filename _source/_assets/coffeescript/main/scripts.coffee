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
  $(window).keydown (event) ->
    switch event.keyCode
      when 27 then escapable()


  $parallaxable = $('[data-parallax]')
  if $parallaxable.length
    $parallaxable.each ->
      $this = $(this)
      $direction = $this.data('parallax-direction')
      $start = $this.data('parallax-start')
      $stop = $this.data('parallax-stop')
      $rate = $this.data('parallax-rate')
      parallax $this, $direction, $start, $stop, $rate


  $('[data-wanker]').wanker()
