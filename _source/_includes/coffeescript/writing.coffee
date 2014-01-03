filterEssays = (essayType) ->
  $essays = $('section.essays > ul')
  $essayList = $essays.find('li')
  $nonfavorites = $essays.find('li:not([data-favorite])')
  $favoriteToggle = $('[data-essay-filter~="favorites"]')

  switch essayType
    when 'favorites'
      if $favoriteToggle.hasClass 'selected' then $nonfavorites.show() else $nonfavorites.hide()
      $favoriteToggle.toggleClass 'selected'
    when 'recent'
      $essayList.sort(newestFirst).appendTo $essays
    when 'shortest'
      $essayList.sort(shortestFirst).appendTo $essays

shortestFirst = (a, b) ->
  if ($(b).data('words')) < ($(a).data('words')) then 1 else -1

longestFirst = (a, b) ->
  if ($(b).data('words')) > ($(a).data('words')) then 1 else -1

newestFirst = (a, b) ->
  if ($(b).data('date')) < ($(a).data('date')) then 1 else -1

oldestFirst = (a, b) ->
  if ($(b).data('date')) > ($(a).data('date')) then 1 else -1

$ ->
  $essays = $('section.essays ul')
  $essayList = $essays.find('li')

  # Estimated reading time
  $essayList.each ->
    $words = $(this).data('words')
    $readingTime = Math.floor($words / 3)

    if $readingTime < 60
      $(this).find('[data-reading-time]').text $readingTime + ' second read'
    else
      $readingTime = Math.floor($readingTime / 60)
      $(this).find('[data-reading-time]').text $readingTime + ' minute read'


  # Fade each essay in
  $delay = 0
  $essayList.each ->
    $delay += 50
    $(this).css opacity: 0
    $(this).delay($delay).fadeTo 500, 1


  # Essay filtering
  $('[data-essay-filter]').click ->
    filterEssays $(this).data('essay-filter')

    if $(this).find('span').hasClass 'radio'
      $(this).addClass 'selected'
      $(this).siblings().removeClass 'selected'


  # Fade each thought in
  $thoughtList = $('[data-thought]')
  $thoughtList.each ->
    $delay += 50
    $(this).css opacity: 0
    $(this).delay($delay).fadeTo 500, 1