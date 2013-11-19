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
