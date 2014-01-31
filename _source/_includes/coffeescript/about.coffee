toggleBio = (bio) ->
  swap = (bio) ->
    $bio = $('section.biography')
    $bio.find('article').fadeOut -> $bio.find(bio).fadeIn()

  position = document.body.scrollTop
  if position > 200
    $('body').animate scrollTop: 0,
      duration: 500
      complete: -> swap bio
  else
    swap bio


$ ->
  # Toggle long versus short biographies.
  $('[data-bio]').on 'click', -> toggleBio $(this).data('bio')

  # Visual effect: slide toggle up when scrolling down.
  # parallax $portraitToggle, 'top', -40, 250, -1.5