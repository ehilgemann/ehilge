exitProject = ->
  # Reset headline and title
  document.title = "The work & play of Mig Reyes"
  $('body.portfolio h1').text 'Work is play'
  window.history.pushState('', '', '/makes')

  # Reset portfolio view
  $('[data-behavior~="all-projects"]').hide()
  $('div.project').show()
  $('div.project-details').hide()

$ ->

  $('[data-behavior~="project"]').click ->
    $headline = $(this).data 'headline'
    $title = $(this).data 'title'
    $url = $(this).find('a').attr 'href'
    $details = $(this).find('.project-details')

    # Update Headline
    $('body.portfolio h1').text $headline

    # Append entire project
    if $details.length
      $details.show()
      console.log "Exists"
    else
      $project = $('<div class="project-details">').load($url + ' .details')
      $(this).append $project

    window.history.pushState('project', '', $url)
    document.title = $title

    $('.projects-toggles button').show()

    $('[data-behavior~="all-projects"]').show()

    $(this).siblings().hide()

    false

  $('[data-behavior~="all-projects"]').click ->
    exitProject()