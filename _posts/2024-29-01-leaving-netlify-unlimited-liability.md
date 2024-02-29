---
layout: blog
categories: blog
tags: devto netlify vue javascript
imagedir: /assets/images/leaving_netlify
---

## Background

I've had 3 sites on netlify since 2022. 
| URL                                  | Date created |
|--------------------------------------|--------------|
| https://conorscocktails.netlify.app  | 2022-01-06   |
| https://beach-litriochta.netlify.app | 2022-07-12   |
| https://spelling-bnetlify.app        | 2022-08-15   |


I liked the service. Although I wasn't thrilled with their default flow for deployments, so I wrote a [blogpost]({{site.url}}/blog/2022/02/21/netlify-deployments-from-github-without-giving-write-access.html) about how to deploy without giving netlify **read *and* write access** to all of your **public *and* private repositories**.

## Leaving Netlify 

Then I read in the news this week that a random developer using the same supposedly free tier on netlify got hit with a >$100k bill due to a DDOS attack.
https://news.ycombinator.com/item?id=39520776

This is because the netlify free tier is not free. 
https://www.netlify.com/pricing/
Their landing page says `start for free` but if you scroll down you'll see there's a `100GB bandwidth` limit. Normally this would be fine, but when you hit their limit they don't stop service. They might not even inform you until you get a huge bill at the end of the billing period.

![netlify-terms]({{ '/netlify-terms.png' | prepend: page.imagedir | absolute_url }})

They also do not protect against DDOS. They just continue service with you get their high rate of `$55 per 100GB`. For comparison AWS egress is around `$9 per 100GB`, and that's still high. https://www.hostdime.com/blog/data-egress-fees-cloud/

I've been stretched thin lately and not working on personal projects, but the thought of a potentially infinite bill definitely kicked me into gear.
As of today I've duplicated all my netlify sites to cloudflare pages.

1. https://conors-cocktails.pages.dev
2. https://beach-litriochta.pages.dev
3. https://spelling-bee-free.pages.dev

I've deleted conorscocktails from netlify, and I'll remove the other 2 in the next few days.

## Moving to cloudflare pages

I found the dev experience really good moving to [cloudflare pages](https://pages.cloudflare.com/).
They give you preview sites based on pr builds for free.
The github access is very easily controlled. They only ask for read acces and you can choose the repositorys they get access to.
They do ask for write acces to metdata so they can put status messages on PRs, but I like that.

I only had 2 tiny issues:
1. I needed to set an environment variable `YARN_VERSION` to get the build to work
  (the default yarn version was too high, so I got failures like this)
2. I had to delete and recreate a site to change the pages.dev url
  https://developers.cloudflare.com/pages/platform/known-issues/#build-configuration
  > If you need to change your *.pages.dev subdomain, delete your project and create a new one.

Other than that it was seamless. Definitely easier than the github action setup I needed for netlify.

Most importantly, on the free plan if you exceed their limits, they shutdown the site instead of charging you a potentially infinite bill at the end of the month!
https://developers.cloudflare.com/pages/functions/pricing/#free-plan

The icing on the cake is
> On both free and paid plans, requests to static assets are free and unlimited


## Conclusion

Although the [Netlify CEO said they'd waive this bill](https://news.ycombinator.com/item?id=39521986), I wouldn't recommend you host any site on netlify, unless you're positive 100Gb of request will net you more than netlify charge. For me I don't run ads or make money in any way per request, so I'll be leaving entirely.

It seems like this tactic isn't limited to netlify. Vercel do something similar. https://serverlesshorrors.com/all/vercel-23k
Generally I think this pattern is very dangerous. As commenters pointed out https://news.ycombinator.com/item?id=39520981
> It's unbounded liability. Not to mention the strong conflict of interest for netlify, who stands to gain from their customers being attacked. Netlify is getting paid for something criminal in nature having occurred.

If you're looking for an alternative, I really like [cloudflare pages](https://pages.cloudflare.com/) so far.