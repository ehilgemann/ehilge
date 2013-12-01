$ ->

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

    $('.projects-toggles button').show()

    $('[data-behavior~="all-projects"]').show()

    $(this).siblings().hide()

    false

  $('[data-behavior~="all-projects"]').click ->
    # Reset headline and title
    document.title = "The work & play of Mig Reyes"
    $('body.portfolio h1').text 'Work is play'

    # Reset portfolio view
    $('div.project').show()
    $('div.details').hide()
    $(this).hide()