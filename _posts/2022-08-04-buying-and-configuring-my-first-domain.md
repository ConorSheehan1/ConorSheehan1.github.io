---
layout: blog
categories: blog
tags: devto hosting
imagedir: /assets/images/beach_litriochta
---

Recently I made an Irish version of the New York Times [spelling bee](https://www.nytimes.com/puzzles/spelling-bee) game. I wanted to host it on a domain that was easy to remember, but I'd never bought or configured a domain before. Here's what I learned along the way.

## Buying the domain
First I had to choose a company to buy the domain from. I wanted a '.ie' domain since it's an Irish game, so that limited the options anyway.
Initially, I was thinking of using [GoDaddy](https://www.godaddy.com), but they require a tax ID. The only Irish tax ID I know of is a PPSN, which you're not meant to share with anyone but the government. After asking around on [r/DevelEire](https://www.reddit.com/r/DevelEire) I decided to go with [blacknight](https://www.blacknight.com). It's an Irish company so it was simpler to buy a '.ie' domain from them, and they had similar prices anyway.

Next, I had to choose a domain. I named the game [beach litríochta](https://beach-litriochta.netlify.app), which is a rough translation of spelling bee. Initially I wanted [https://beach.ie](https://beach.ie) because it'd be super easy to remember, makes sense in both English and Irish, and is kind of funny since "Beach" means bee in Irish.

![beach-meme]({{ '/beach_meme.webp' | prepend: page.imagedir | absolute_url  }})

I thought the domain was free, but it just had a slow redirect. It resolves to [https://beachawards.ie](ttps://beachawards.ie), so I couldn't get it. Instead I went with [https://www.beacha.ie](https://www.beacha.ie). Beacha is the plural of beach, and it's still short and hopefully easy to remember.

Buying the domain was pretty straight forward. I had to upload a picture of my ID to blacknight to prove I'm an Irish citizen and that was it really.

## Configuring the domain
This is where I ran into some issues. Blacknight is changing it's control panel, so a lot of its support forum FAQs won't work for new customers.
The old control panel is at [https://cp.blacknight.com](https://cp.blacknight.com), but I was a new customer so I had to use [https://cp.blacknighthosting.com](https://cp.blacknighthosting.com).

![blacknight-control-panel]({{ '/blacknight_control_panel_update.png' | prepend: page.imagedir | absolute_url }})

I already had my game hosted with Netlify, so all I needed was to forward the traffic from my new domain to Netlify.
I found this [blacknight support article on domain forwarding](https://help.blacknight.com/hc/en-us/articles/212523009-Domain-Forwarding), but it was using the old blacknight control panel so I couldn't use it.

I managed to get things working by following the [Netlify docs](https://docs.netlify.com/domains-https/netlify-dns/delegate-to-netlify/), some back and forth with blacknight support, and some trial and error. Here's what I did to set up forwarding:

### Forwarding traffic
1. Go to Netlify and select your site -> site settings -> domain management
![netlify_domain_management]({{ '/netlify_domain_management.png' | prepend: page.imagedir | absolute_url }})
2. Add your custom domain(s)
3. Click the options dropdown -> Go to DNS panel
![netlify_dns_list]({{ '/netlify_dns_list.png' | prepend: page.imagedir | absolute_url }})
4. Copy the 4 DNS entries from Netlify
5. Go to the [blacknight control panel](https://cp.blacknighthosting.com).
6. Click the domains dropdown -> your domain
![blacknight_domain]({{ '/blacknight_domain.png' | prepend: page.imagedir | absolute_url }})
7. Click Nameservers Management
![blacknight_nameservers_management]({{ '/blacknight_nameservers_management.png' | prepend: page.imagedir | absolute_url }})
8. Select custom nameservers and paste in the values you copied from Netlify.
![blacknight_custom_nameservers]({{ '/blacknight_custom_nameservers.png' | prepend: page.imagedir | absolute_url }})
9. Now you have to wait "/. I left it overnight, and in the morning my domain was redirecting correctly!

If you're interested in learning Irish or spelling games in general please check out [https://beacha.ie](https://beacha.ie)! It's free and the code is open source [https://github.com/ConorSheehan1/beach-litriochta](https://github.com/ConorSheehan1/beach-litriochta).