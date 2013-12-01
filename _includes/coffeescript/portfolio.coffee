# loadProject = (url, headline, title) ->
  # $('.projects').load (url + ' .project'), ->
  #   console.log 'Loaded'

$ ->
  $('#time').text Date()

  $('[data-behavior~="project"]').click ->
    $headline = $(this).data 'headline'
    $title = $(this).data 'title'
    $url = $(this).find('a').attr 'href'

    # Update Headline
    $('body.portfolio h1').text $headline

    # Append entire project
    $project = $('<div>').load($url + ' .details')
    $(this).append $project

    window.history.pushState('project', '', $url)
    document.title = $title

    false