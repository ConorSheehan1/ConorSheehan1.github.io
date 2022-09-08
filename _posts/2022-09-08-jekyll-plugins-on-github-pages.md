---
layout: post
categories: personal
tags: jekyll ruby github-pages
---

I finally got tags and categories pages working for this website!
[https://github.com/ConorSheehan1/ConorSheehan1.github.io/releases/tag/v3.0.0](https://github.com/ConorSheehan1/ConorSheehan1.github.io/releases/tag/v3.0.0)

To get the build working I had to use the [jekyll-deploy-action](https://github.com/jeffreytse/jekyll-deploy-action).  
[Github doesn't support](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll#plugins) the [jekyll-tagging](https://github.com/pattex/jekyll-tagging) plugin I'm using.
 
I had [some issues](https://github.com/jeffreytse/jekyll-deploy-action/issues/48) along the way. I had the usual problems with browser cache where I wasn't sure if my css was really broken or just cached. What ended up working for me was adding `baseurl: ""` to `_config.yml`.

You can see the [tags](./tags) and [categories](./categories) pages here.