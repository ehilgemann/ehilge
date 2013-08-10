$ ->
  $biographyScope = $('[data-biography]')

  $('#biography-chooser').on 'click', 'li', ->
    $bioLength = $(this).data('bio')
    $bioChoice = $biographyScope.find('.biography-'+$bioLength)

    $bioChoice.show()
    $bioChoice.siblings('article').hide()