closeProject = ->
  # Reset headline and title
  document.title = "The work & play of Mig Reyes"
  $('[data-project-header]').text 'Work and play'
  window.history.pushState('', '', '/makes')

  # Reset portfolio view
  $('[data-project]').show()
  $('div.project-details').hide()
  $('[data-behavior="close"]').hide()

$ ->
  # Setup objects
  $headline = $('[data-project-header]')
  $closeButton = $('[data-behavior="close"]')

  $('[data-project-DISABLED]').click ->
    # Update Headline
    $projectName = $(this).find('h1').text()
    $headline.text $projectName

    # Hide every other project
    $(this).siblings().hide()

    # Reveal the entire project
    $details = $(this).find('.project-details')

    if $details.length
      $details.show()
    else
      $url = $(this).find('a').attr 'href'
      $project = $('<div class="project-details">').load($url + ' .details')
      $(this).append $project

    # Change browser state
    document.title = $projectName + ' by Mig Reyes'
    window.history.pushState('', '', $url)

    # Show close button
    $closeButton.show()

    # Don’t follow URL
    false

  $closeButton.click -> closeProject()