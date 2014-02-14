$ ->
  $nav = $(".nav-links")

  $trigger = $(".nav-links-trigger")
  $trigger.click ->
    $nav.toggleClass "nav-links-expanded"