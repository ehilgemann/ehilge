getTwitters('tweet', {
  id: 'migreyes',
  count: 1,
  enableLinks: true,
  ignoreReplies: true,
  clearContents: true,
  template: '%text% <span style="color: #CCC;">&ndash;</span> <a href="http://twitter.com/%user_screen_name%/statuses/%id%/">%time%</a>'
});