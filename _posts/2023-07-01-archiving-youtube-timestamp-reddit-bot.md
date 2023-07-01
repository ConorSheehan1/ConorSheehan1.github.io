---
layout: blog
categories: blog
tags: devto
imagedir: /assets/images/youtube_timestamp_redditbot
status: archived
---

I have been meaning to write another article about the [YouTubeTimestampRedditBot](https://github.com/ConorSheehan1/YouTubeTimestampRedditBot) I made for a while now. My [last article]({{site.url}}/personal/2021/09/16/youtube-timestamp-reddit-bot.html) was nearly 2 years ago!
Unfortunately this post will mostly be about why I'm archiving it. But first, some interesting bits about it:

## Using reddit as a makeshift database
I found lots of other bots used databases to keep track of things, like what threads they'd already seen or commented on. I managed to work around this by having the bot [pm itself](https://github.com/ConorSheehan1/YouTubeTimestampRedditBot/blob/e51b976e2c772dcfcea622217b074030c82c2b8a/src/bot.py#L93), using reddit itself as a makeshift database. I'd use these pms like logs to debug when things went wrong, and to generally keep track of posts the bot interacted with.
![example_logs]({{ '/example_logs.png' | prepend: page.imagedir | absolute_url  }})

I thought this technique might benefit other bot developers and lower costs for hosting bots, but that seems a bit pointless now that reddit is starting to charge quite a lot for API requests that were previously free. The API pricing has caused [a lot](https://www.reddit.com/r/redditisfun/comments/144gmfq/rif_will_shut_down_on_june_30_2023_in_response_to/) [of controversy](https://www.reddit.com/r/apolloapp/comments/13ws4w3/had_a_call_with_reddit_to_discuss_pricing_bad/).

While the bot _could_ continue to use the API for free based on [https://www.redditinc.com/blog/apifacts](https://www.redditinc.com/blog/apifacts) I don't really see any point in working to get it online again.
> Effective July 1, 2023, the rate limits to use the Data API free of charge are 100 queries per minute per OAuth client id if you are using OAuth authentication and ten queries per minute if you are not using OAuth authentication. 

## Getting into the top 100 ranked bots
Before the heroku free tier shutdown the bot was running fairly regularly, and managed to just edge in to the top 100 ranked bots on [botranks.com](https://botranks.com/?bot=YouTubeTimestampBot)!
![ranked_99]({{ '/crop_botrank-99_20220920.jpg' | prepend: page.imagedir | absolute_url  }})

I don't remember exactly what rank it started at, but it was very low. The lowest screenshot I could find was ranked 350 on 2021-11-24.
![ranked_350]({{ '/crop_botrank-350_20211024.jpg' | prepend: page.imagedir | absolute_url  }})

It had climbed to 150 by 2022-05-10, and 99 by 2022-09-20. I think it kept a pretty good pace. By the end it had around 1k karma and 90 "good bot" votes.
![bot_rank_graph]({{ '/YouTubeTimestampRedditBotRankGraph.png' | prepend: page.imagedir | absolute_url  }})

Unfortunately the [botranks](ttps://botranks.com) site itself is in danger of shutting down, since it uses the [pushshift API](https://pushshift.io/), which is also [probably shutting down](https://www.reddit.com/r/modnews/comments/134tjpe/reddit_data_api_update_changes_to_pushshift_access/) [due to the API charges!](https://www.reddit.com/r/pushshift/comments/13mhuzq/api_has_been_taken_down/)


## Decision to archive
A few things have influenced my decision to archive the bot:
1. [The heroku free tier ending](https://blog.heroku.com/next-chapter)
2. [Reddit API changing from free to expensive](https://www.cnbc.com/2023/06/16/reddit-in-crisis-as-prominent-moderators-protest-api-price-increase.html)
3. Lack of interest in working on the bot, and reddit in general

I was  a redditor for nearly a decade. I was even a moderator on a few small subreddits (just setting up automod and editing some CSS). Reddit has always had its problems but this really feels like a tipping point. As of today I won't be using reddit, and I'm archiving this bot. Lots of third party reddit apps like RIF and Apollo stopped working today, so it seems like a fitting time to fully archive my reddit bot and move on. I'm going to go touch some grass.