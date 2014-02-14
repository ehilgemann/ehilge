toggleBiography = (bio) ->
  swap = (bio) ->
    $bio = $('.about-biography')
    $bio.find('article').fadeOut ->
      $bio.find(bio).fadeIn()

  position = document.body.scrollTop

  if position > 200
    $('body').animate scrollTop: 0,
      duration: 500
      complete: -> swap bio
  else
    swap bio


$ ->
  # Toggle long versus short biographies.
  $('[data-toggle-bio]').click -> toggleBiography $(this).data('toggle-bio')