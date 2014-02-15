$ ->
  $nav     = $(".nav-links")
  $links   = $(".nav-links-list li")
  $trigger = $(".nav-links-trigger")

  $trigger.click ->
    $this   = $(@)
    $status = $this.data "menu"
    $delay  = 0

    switch $status
      when "closed"
        $this.data "menu", "open"
        $nav.addClass "nav-links-expanded"
        $links.each ->
          $(@).css opacity: 0
          $(@).delay($delay).fadeTo 300, 1
          $delay += 25
      when "open"
        $this.data "menu", "closed"
        $nav.removeClass "nav-links-expanded"