relativeTime = (->
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
  if $(".shares-content").length
    # Delicious
    $.getJSON "http://feeds.delicious.com/v2/json/migreyes?callback=?",
      count: "5", (data) ->
        $.each data, (i, item) ->
          title = item.d
          url = item.u
          date = relativeTime item.dt
          comment = item.n
          html = """
                 <li class="shares-delicious-link">
                   <span><a href='#{url}'>#{title}</a></span>
                   <em>#{comment} <time>#{date}</time></em>
                 </li>
                 """
          $(".shares-delicious-links").append html


    # GitHub
    $.getJSON "https://api.github.com/users/migreyes/events/public?per_page=3",
      (response) ->
        for activity in response
          do (activity) ->
            date       = relativeTime activity.created_at
            type       = activity.type
            profile    = activity.actor.login

            switch type
              # when "CommitCommentEvent"
              #   html = "<p>Mig commit something. <span>#{date}</span></p>"
              # when "CreateEvent"
              #   html = "<p>Mig created something, #{activity.payload.ref_type}. <span>#{date}</span></p>"
              # when "FollowEvent"
              #   html = "<p>Mig followed #{activity.payload.target}. <span>#{date}</span></p>"
              # when "GollumEvent"
              #   html = "<p>Mig #{activity.payload.pages[0].action} <a href='#{activity.payload.pages[0].html_url}' target='_blank'>#{activity.payload.pages[0].page_name}</a>. <span>#{date}</span></p>"
              # when "WatchEvent"
              #   html = "<p>Mig starred <a href='http://github.com/#{activity.repo.name}'>#{activity.repo.name}</a>. <span>#{date}</span></p>"
              when "PushEvent"
                html = """
                       <div class="shares-github-activity">
                         <span><a href="http://github.com/#{profile}">Mig</a> pushed to <a href="http://github.com/#{activity.repo.name}" target="_blank">#{activity.repo.name}</a></span>
                         <em>#{activity.payload.commits[0].message},</em>
                         <time>#{date}</time>
                       </div>
                       """
              else
                # html = "<p>#{type}.</p>"
                html = ""

            $(".shares-github").append html


    # Instagram Profile
    $.getJSON "https://api.instagram.com/v1/users/4706860/?client_id=66dc56b3318e4c9c8c4ce5283507b947&callback=?",
      (response) ->
        followers = response.data.counts.followed_by
        $("[data-instagram-followers]").text followers

    # Instagram Photos
    $.getJSON "https://api.instagram.com/v1/users/4706860/media/recent/?client_id=66dc56b3318e4c9c8c4ce5283507b947&callback=?",
      (response) ->
        photos = response.data
        for photo in photos
          do (photo) ->
            date     = relativeTime new Date parseInt(photo.created_time) * 1000
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