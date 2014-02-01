(($) ->
  $.fn.wanker = (options) ->
    settings = $.extend(
      duration: 1200
    , options)

    return @each ()->
      $message = $(@)
      resizeTimer = undefined
      mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

      $(window).resize ->
        unless mobile
          # Show the message
          $message.fadeIn()

          # Reset old countdowns
          clearTimeout resizeTimer if resizeTimer

          # Start a new countdown
          resizeTimer = setTimeout(->
            resizeTimer = null
            $message.fadeOut()
          , settings.duration)
) jQuery