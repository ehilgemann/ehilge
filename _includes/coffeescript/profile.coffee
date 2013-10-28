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

  $('section.portrait').on 'click', ->
    $(this).fadeOut()

  $(window).on 'scroll', ->
    $portraitSlider.css 'top', ($(window).scrollTop() * -1.5)

  $('button[data-toggle~="bio"]').on 'click', ->
    $('section.biography').find('button').show()
    $(this).hide()
    toggleBio($(this).data('bio'))


