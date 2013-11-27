filterEssays = (essayType) ->
  $essays = $('section.essays ul')
  $essayList = $essays.find('li')

  switch essayType
    when 'favorites'
      $essays.find('li:not([data-favorite])').hide()
    when 'recent'
      $essayList.show()
    when 'shortest'
      $essayList.sort(shortestFirst).appendTo $essays

shortestFirst = (a, b) ->
  (if ($(b).data('words')) < ($(a).data('words')) then 1 else -1)

longestFirst = (a, b) ->
  (if ($(b).data('words')) > ($(a).data('words')) then 1 else -1)

$ ->
  $essays = $('section.essays')
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

  # Fade each thought in
  $thoughtList = $('[data-thought]')
  $thoughtList.each ->
    $delay += 50
    $(this).css opacity: 0
    $(this).delay($delay).fadeTo 500, 1

  # Essay filtering
  $('[data-essay-filter]').click ->
    filterEssays $(this).data('essay-filter')