
toggleBio = (bioLength) ->
  $bio = $('section.biography')
  $bio.find('article').hide()
  $bio.find(bioLength).show()
  $('html, body').animate({scrollTop: 0}, 600)

$ ->
  $portraitTop = $('.portrait-top')
  $portraitOriginal = $('.portrait')

  $portraitTop.on 'click', ->
    $portraitOriginal.fadeIn()

  $('section.portrait').on 'click', ->
    $(this).fadeOut()

  $(window).on 'scroll', ->
    $portraitTop.css 'top', ($(window).scrollTop() * -1.5)

  $('button[data-toggle~="bio"]').on 'click', ->
    $('section.biography').find('button').show()
    $(this).hide()
    toggleBio($(this).data('bio'))


