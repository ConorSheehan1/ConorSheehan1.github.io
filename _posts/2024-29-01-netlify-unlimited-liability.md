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
  ```log
  2024-02-28T22:24:19.701473Z	Cloning repository...
  2024-02-28T22:24:28.46573Z	From https://github.com/ConorSheehan1/spelling-bee
  2024-02-28T22:24:28.466263Z	 * branch            a72414e9e37afb211cb252f735def0699c7afde6 -> FETCH_HEAD
  2024-02-28T22:24:28.466389Z	
  2024-02-28T22:24:28.779843Z	HEAD is now at a72414e bump to node 20
  2024-02-28T22:24:28.78036Z	
  2024-02-28T22:24:28.872254Z	
  2024-02-28T22:24:28.872724Z	Using v2 root directory strategy
  2024-02-28T22:24:28.901935Z	Success: Finished cloning repository files
  2024-02-28T22:24:29.685291Z	Detected the following tools from environment: nodejs@20.5.1, yarn@3.6.3
  2024-02-28T22:24:29.686191Z	Installing nodejs 20.5.1
  2024-02-28T22:24:29.767353Z	nodejs 20.5.1 is already installed
  2024-02-28T22:24:30.711917Z	Preparing yarn@3.6.3 for immediate activation...
  2024-02-28T22:24:31.208933Z	Installing project dependencies: yarn
  2024-02-28T22:24:31.840021Z	➤ YN0070: Migrating from Yarn 1; automatically enabling the compatibility node-modules linker 👍
  2024-02-28T22:24:31.840655Z	
  2024-02-28T22:24:31.881868Z	➤ YN0000: ┌ Resolution step
  2024-02-28T22:24:32.695791Z	➤ YN0032: │ fsevents@npm:2.3.3: Implicit dependencies on node-gyp are discouraged
  2024-02-28T22:24:33.259218Z	➤ YN0061: │ loupe@npm:2.3.4 is deprecated: Please upgrade to 2.3.7 which fixes GHSA-4q6p-r6v2-jvc5
  2024-02-28T22:24:33.806219Z	➤ YN0061: │ sourcemap-codec@npm:1.4.8 is deprecated: Please use @jridgewell/sourcemap-codec instead
  2024-02-28T22:24:36.317302Z	➤ YN0002: │ spelling-bee@workspace:. doesn't provide @types/node (p56c66), requested by ts-node
  2024-02-28T22:24:36.317601Z	➤ YN0000: │ Some peer dependencies are incorrectly met; run yarn explain peer-requirements <hash> for details, where <hash> is the six-letter p-prefixed code
  2024-02-28T22:24:36.320472Z	➤ YN0000: └ Completed in 4s 439ms
  2024-02-28T22:24:36.344236Z	➤ YN0000: ┌ Post-resolution validation
  2024-02-28T22:24:36.3445Z	➤ YN0028: │ The lockfile would have been modified by this install, which is explicitly forbidden.
  2024-02-28T22:24:36.344679Z	➤ YN0000: └ Completed
  2024-02-28T22:24:36.344842Z	➤ YN0000: Failed with errors in 4s 464ms
  2024-02-28T22:24:36.39492Z	Error: Exit with error code: 1
  2024-02-28T22:24:36.395219Z	    at ChildProcess.<anonymous> (/snapshot/dist/run-build.js)
  2024-02-28T22:24:36.395441Z	    at Object.onceWrapper (node:events:652:26)
  2024-02-28T22:24:36.395598Z	    at ChildProcess.emit (node:events:537:28)
  2024-02-28T22:24:36.39575Z	    at ChildProcess._handle.onexit (node:internal/child_process:291:12)
  2024-02-28T22:24:36.404411Z	Failed: build command exited with code: 1
  2024-02-28T22:24:37.390394Z	Failed: error occurred while running build command
  ```
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