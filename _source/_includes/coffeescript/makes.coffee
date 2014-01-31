$ ->
  $projects = $('[data-project]')

  $projects.click ->
    $projects.removeClass 'full'
    $(this).addClass 'full'