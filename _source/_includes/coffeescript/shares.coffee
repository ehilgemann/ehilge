niceTime = (->
  ints =
    second: 1
    minute: 60
    hour: 3600
    day: 86400
    week: 604800
    month: 2592000
    year: 31536000

  (time) ->
    time = +new Date(time)
    gap = ((+new Date()) - time) / 1000
    amount = undefined
    measure = undefined
    for i of ints
      measure = i  if gap > ints[i]
    amount = gap / ints[measure]
    amount = (if gap > ints.day then (Math.round(amount)) else Math.round(amount))
    amount += " " + measure + ((if amount > 1 then "s" else "")) + " ago"
    amount
)()

$ ->
  # Instagram Profile
  $.getJSON "https://api.instagram.com/v1/users/4706860/?client_id=66dc56b3318e4c9c8c4ce5283507b947&callback=?",
    (response) ->
      name = response.data.username
      avatar = response.data.profile_picture
      followers = response.data.counts.followed_by
      $(".shares-instagram-profile").append "#{name} is followed by #{followers} people."

  # Instagram Photos
  $.getJSON "https://api.instagram.com/v1/users/4706860/media/recent/?client_id=66dc56b3318e4c9c8c4ce5283507b947&callback=?",
    (response) ->
      photos = response.data
      for photo in photos
        date     = niceTime new Date parseInt(photo.created_time) * 1000
        link     = photo.link
        likes    = photo.likes.count
        source   = photo.images.standard_resolution.url
        caption  = photo.caption.text
        location = photo.location.name
        html     = """
                   <div class="shares-instagram-photo" style="background-image: url('#{source}');">
                     <img src="/assets/images/shares/instagram.gif">
                     <a href="#{link}" target="_blank">
                       <div class="shares-instagram-photo-info">
                         <p>#{caption}</p>
                         <em>#{date} at #{location}</em>
                         <span>&hearts; #{likes}</span>
                       </div>
                     </a>
                   </div>
                   """
        $(".shares-instagram").append html

  # Instapaper
  # $.getJSON "https://www.instapaper.com/api/1/migreyes?callback=?",
  #   (response) ->
  #     console.log response


  # Delicious
  $.getJSON "http://feeds.delicious.com/v2/json/migreyes?callback=?",
    count: "10", (data) ->
      $.each data, (i, item) ->
        title = item.d
        url = item.u
        date = niceTime item.dt
        comment = item.n
        html = """
               <li class="shares-delicious-link">
                 <span><a href='#{url}'>#{title}</a></span>
                 <em>#{comment} <time>#{date}</time></em>
               </li>
               """
        $(".shares-delicious-links").append html
