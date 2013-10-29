toggleBio = (bioLength) ->
  $bio = $('section.biography')
  $bio.find('article').hide()
  $bio.find(bioLength).show()
  $('html, body').animate({scrollTop: 0}, 600)

$ ->
  $portraitSlider = $('.portrait-slider')
  $portraitOriginal = $('.portrait')

  $portraitSlider.find('img').on 'click', ->
    $portraitOriginal.fadeIn()

  $portraitOriginal.on 'click', ->
    if $(window).width() >= 800
      $(this).fadeOut()

  $(window).on 'scroll', ->
    $portraitSlider.css 'top', ($(window).scrollTop() * -1.5)

  # Toggle long versus short biographies.
  $('[data-toggle~="bio"]').on 'click', ->
    toggleBio($(this).data('bio'))


