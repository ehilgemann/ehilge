parallax = (element, start, stop, rate) ->
  $(window).on 'scroll', ->
    position = document.body.scrollTop

    if position >= start and position <= stop
      element.css 'top', ($(window).scrollTop() * rate)

toggleBio = (bioLength) ->
  $bio = $('section.biography')
  $bio.find('article').hide()
  $bio.find(bioLength).show()
  $('html, body').animate({scrollTop: 0}, 600)

$ ->
  $portraitOverlay = $('.portrait')

  $('.portrait-toggle img').on 'click', -> $portraitOverlay.fadeIn()

  $portraitOverlay.on 'click', ->
    if $(window).width() >= 800
      $(this).fadeOut()

  # Toggle long versus short biographies.
  $('[data-toggle~="bio"]').on 'click', -> toggleBio($(this).data('bio'))

  parallax($('.portrait-toggle'), -40, 250, -1.5)

