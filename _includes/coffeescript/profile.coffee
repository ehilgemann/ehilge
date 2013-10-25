$ ->
  $meTop = $('.portrait-top')
  $meOriginal = $('.portrait-overlay')

  $(window).on "scroll", ->
    $meTop.css 'top', ($(window).scrollTop() * -1.5)
