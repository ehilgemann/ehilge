$ ->
  $essays = $('section.essays')
  $essayList = $essays.find('li')

  # Estimated reading time
  $essayList.find('[data-words]').each ->
    $words = $(this).data('words')
    $readingTime = Math.floor($words / 3)

    if $readingTime < 60
      $(this).text $readingTime + ' second read'
    else
      $readingTime = Math.floor($readingTime / 60)
      $(this).text $readingTime + ' minute read'

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