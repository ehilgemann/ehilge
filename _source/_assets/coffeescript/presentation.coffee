$ ->
  # Open presentation overlay.
  $presentationToggle = $('[data-show]')
  $presentationToggle.click ->
    $('[data-presentation="' + $(this).data('show') + '"]').fadeIn()

  # Close presentation overlay.
  $('[data-presentation]').click ->
    if $(window).width() >= 768 then $(this).fadeOut()