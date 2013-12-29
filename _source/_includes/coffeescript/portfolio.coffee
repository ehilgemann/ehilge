
$ ->
  $projects = $('[data-project]')
  $projects.click ->
    $(this).find('figure').toggleClass 'active'
    $(this).find('blockquote').toggleClass 'active'