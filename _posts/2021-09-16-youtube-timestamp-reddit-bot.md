---
layout: post
categories: personal
tags: python bot reddit

project_title: "YouTubeTimestampRedditBot"
src: https://github.com/ConorSheehan1/YouTubeTimestampRedditBot
live: https://www.reddit.com/user/YouTubeTimestampBot
status: archived
---

I recently created [YouTubeTimestampRedditBot](https://github.com/ConorSheehan1/YouTubeTimestampRedditBot). It's a bot that checks reddit for posts which:
1. link to YouTube
1. reference a timestamp in the title
1. don't embed the timestamp in the link

It comments on those posts with an updated link that has the timestamp embedded, hopefully saving people precious milliseconds navigating to the time in the video.

## Bot ranking
While building this bot I learned that there are multiple bot ranking pages for reddit.
1. [https://botrank.pastimes.eu](https://botrank.pastimes.eu/)
1. [https://botranks.com](https://botranks.com/?bot=YouTubeTimestampBot)

I prefer [botranks.com](https://botranks.com/?bot=YouTubeTimestampBot) because it's [open source on github](https://github.com/Brandawg93/Botranks) and has [my bot](https://botranks.com/?bot=YouTubeTimestampBot) listed!

About a month into running my bot I found that there's already a similar bot called [reddit-timestamp-bot](https://github.com/ankitgyawali/reddit-timestamp-bot). 
It checks for timestamps in comments rather than titles, and has a very different implementation, so I'm going to keep mine running for now.

## Hosting (heroku)
I learned a lot about heroku while trying to host this bot, such as the fact that the free tier gives you [550 dyno hours per month](https://devcenter.heroku.com/articles/free-dyno-hours#free-dyno-hour-pool). Given a month with 31 days has 744 hours, this leaves me short about 194 hours or ~8 days per month.
I also learned heroku doesn't accept revolute, so I can't get the extra 450 dyno hours by adding a payment method. And that I can't set up addons like heroku cron without adding a payment method, so I just have to deal with the ~8 days downtime per month.

## Reddit
I got surprisingly positive responses on reddit.
>  Wow I am shocked. Someone made an actual fucking useful bot that isnt posting some stupid bullshit in shakespeare or yoda speak or giving me a pointless fact barely related to my comment.
\- [u/The_lolrus_](https://old.reddit.com/r/TheDickShow/comments/qglluu/1700_video_glitch_just_moments_before_1st_smurf/hiao375/)

> Wow! You are an intelligent bot! 🤖 
\- [u/feeedi](https://old.reddit.com/r/donorconception/comments/q9tzkp/to_understand_what_epigenetics_is_watch_this/hgyk21r/)

> Good bot, its sadly not possible to make timestamps on phone
\- [u/RayliOtter](https://old.reddit.com/r/ADCMains/comments/q3eer6/at_525_they_talk_about_lethal_tempo_update_what/hfr660a/)

The last comment about not being able to make timestamps on a phone easily is one of the main reasons I made the bot.
I remember there used to be an option to include the current time when sharing a YouTube video on any device, but that feature disappeared a while ago.

Of course there were a few bugs in the bot early on. And there's probably still more. But generally I'm happy with the bot for now and I plan to maintain it.
I hope it saves you precious milliseconds.