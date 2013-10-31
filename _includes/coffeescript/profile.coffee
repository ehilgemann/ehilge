parallax = (element, direction, start, stop, rate) ->
  $(window).on 'scroll', ->
    position = document.body.scrollTop

    if position >= start and position <= stop
      element.css direction, ($(window).scrollTop() * rate)

toggleBio = (bioLength) ->
  $bio = $('section.biography')
  $bio.find('article').hide()
  $bio.find(bioLength).show()
  $('html, body').animate({scrollTop: 0}, 600)

$ ->
  $portraitToggle = $('.portrait-toggle')
  $portraitOverlay = $('.portrait')

  # Show zoomed-in portrait overlay.
  $portraitToggle.find('img').on 'click', -> $portraitOverlay.fadeIn()

  # Close zoomed-in portrait overlay.
  $portraitOverlay.on 'click', ->
    if $(window).width() >= 800
      $(this).fadeOut()

  # Toggle long versus short biographies.
  $('[data-toggle~="bio"]').on 'click', -> toggleBio($(this).data('bio'))

  # Visual effect: slide toggle up when scrolling down.
  parallax $portraitToggle, 'top', -40, 250, -1.5

