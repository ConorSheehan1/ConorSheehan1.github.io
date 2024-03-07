---
layout: blog
categories: blog
tags: devto hosting javascript
imagedir: /assets/images/leaving_netlify
---

## Background

I've had 3 sites on netlify since 2022. 

| URL                                  | Date created |
|--------------------------------------|--------------|
| https://spelling-b.netlify.app       | 2022-08-15   |
| https://beach-litriochta.netlify.app | 2022-07-12   |
| https://conorscocktails.netlify.app  | 2022-01-06   |


I liked the service, although I wasn't thrilled with their default flow for deployments. I wrote a [blogpost]({{site.url}}/blog/2022/02/21/netlify-deployments-from-github-without-giving-write-access.html) about how to deploy without giving netlify **read *and* write access** to all of your **public *and* private repositories**.

## Leaving Netlify 

Then I read in the news last week that a random developer using the same supposedly free tier on netlify got hit with a >$100k bill due to a DDOS attack. [https://news.ycombinator.com/item?id=39520776](https://news.ycombinator.com/item?id=39520776)

This is because the netlify free tier is not free. 
[https://www.netlify.com/pricing](https://www.netlify.com/pricing)

Their landing page says `start for free` but if you scroll down you'll see there's a `100GB bandwidth` limit, and a fee for any traffic over the limit.

![netlify-terms]({{ '/netlify-terms.png' | prepend: page.imagedir | absolute_url }})

Normally this would be fine, but when you hit their limit they don't stop service. They might not even inform you that you've exceeded the free limit until you get a bill at the end of the month.

They also do not protect against DDOS. They just continue service with their high rate of `$55 per 100GB`. For comparison AWS is around `$9 per 100GB`, and that's still high IMO. [https://www.hostdime.com/blog/data-egress-fees-cloud](https://www.hostdime.com/blog/data-egress-fees-cloud)

I've been stretched thin lately and not working on personal projects, but the thought of a potentially infinite bill definitely kicked me into gear.
Last week I copied all my netlify sites to cloudflare pages.

1. [https://conors-cocktails.pages.dev](https://conors-cocktails.pages.dev)
2. [https://beach-litriochta.pages.dev](https://beach-litriochta.pages.dev)
3. [https://spelling-bee-free.pages.dev](https://spelling-bee-free.pages.dev)

Today I deleted all my netlify sites and my netlify account.
I managed to run those 3 sites on netlify for the last 2 years with ~20Gb bandwidth usage, but I'm not willing to stay given the risk.

## Moving to cloudflare pages

I found the dev experience really good moving to [cloudflare pages](https://pages.cloudflare.com/).
They give you preview sites based on pr builds for free.
The github access is very easily controlled. They only ask for read access and you can choose the repositories they get access to.
They do ask for write access to metadata so they can put status messages on PRs, but I like that.

I only had 2 tiny issues:
1. I needed to set an environment variable `YARN_VERSION` to get the build to work
2. I had to delete and recreate a site to change the pages.dev url
  [https://developers.cloudflare.com/pages/platform/known-issues/#build-configuration](https://developers.cloudflare.com/pages/platform/known-issues/#build-configuration])
  > If you need to change your *.pages.dev subdomain, delete your project and create a new one.

Other than that it was seamless. Definitely easier than the github action setup I needed for netlify.

Most importantly, on the free plan if you exceed their limits, they shutdown the service instead of continuing and charging you! [https://developers.cloudflare.com/pages/functions/pricing/#free-plan](https://developers.cloudflare.com/pages/functions/pricing/#free-plan)

The icing on the cake is
> On both free and paid plans, requests to static assets are free and unlimited

![cloudflare-terms]({{ '/cloudflare-terms.png' | prepend: page.imagedir | absolute_url }})

This reminds me of the good old days on heroku, where you had a free limit on compute each month, and if you exceeded it the service just stopped.

## Conclusion

Although the [Netlify CEO said they'd waive this bill](https://news.ycombinator.com/item?id=39521986), I wouldn't recommend you host any site on netlify, unless you're absolutely sure 100Gb of requests will make you more than netlify charge. For me I don't run ads or make money per request, so I'll be leaving entirely.

It seems like this tactic of keeping service up no matter what and charging high fees later isn't limited to netlify. Vercel do something similar. [https://serverlesshorrors.com/all/vercel-23k](https://serverlesshorrors.com/all/vercel-23k)
Generally I think this pattern is very dangerous. As a [commenter on hackernews pointed out](https://news.ycombinator.com/item?id=39520981) 
> It's unbounded liability. Not to mention the strong conflict of interest for netlify, who stands to gain from their customers being attacked.

If you're looking for an alternative, I'd recommend [cloudflare pages](https://pages.cloudflare.com/). I found it great so far.