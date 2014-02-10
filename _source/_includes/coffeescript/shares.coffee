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
  # Instagram
  $.getJSON "https://api.instagram.com/v1/users/self/feed?client_id=66dc56b3318e4c9c8c4ce5283507b947&callback=?",
    (data) ->
      console.log data

  # Instapaper
  # "http://www.instapaper.com/rss/1400362/oFKQiPVwEaQ7gP44mX3Vu5rqxE8?callback=?",

  # Delicious
  $.getJSON "http://feeds.delicious.com/v2/json/migreyes?callback=?",
    count: "10", (data) ->
      $.each data, (i, item) ->
        title = item.d
        url = item.u
        date = niceTime item.dt
        comment = item.n
        html = """
               <li>
                 <span class="shares-delicious-link"><a href='#{url}'>#{title}</a></span>
                 <em>#{comment} — <time>#{date}</time></em>
               </li>
               """
        $(".shares-delicious-links").append html
