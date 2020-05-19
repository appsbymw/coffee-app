---
layout: default
title: Live Streams
---

# Live Streams

All development on Coffee Companion is being done in the open and being streamed on [Twitch.tv](https://www.twitch.tv/appsbymw). Currently each Monaday at 1pm CDT Maegan will go live and build the next part of the app.

# Missed a Live Stream?

If you missed a live stream, you can watch the archives on [YouTube](https://www.youtube.com/playlist?list=PL9MW-diYJQnX-kcmMuJLtkDay1dgVtrI0) but make sure to subscribe to the channel!

You can also catch them all here.

{% assign sorted = site.data.videos%}
{% for video in sorted %}
## {{ video.date }}

Click here to read the [live stream recap.]({{video.post-link}})

<div class="video-container">
  <iframe
  width="100%"
  src="https://www.youtube.com/embed/{{ video.id }}"
  frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
  </iframe>
</div>


{% endfor %}