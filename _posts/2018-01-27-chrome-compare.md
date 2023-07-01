---
layout: post
categories: personal
tags: javascript browser-extension

project_title: "Chrome Compare"
project_id: chrome_compare
src: https://github.com/ConorSheehan1/chrome-compare
# live: https://chrome.google.com/webstore/detail/chrome-compare/fbojbhlkngpihcjhjhadacdfikocgjfe
status: archived
---

Archived due to [manifest v3](https://developer.chrome.com/docs/extensions/mv3/intro/#start-the-conversion)

I often found myself having to compare pages when upgrading legacy web applications. The urls were usually similar, but had a different host name or parameter. In order to speed up the comparisons, I made a chrome extension that reads the current url, gets all the variations of the url you specify, and opens them in new tabs.  

The example in the README uses stack exchange sites, since they mostly follow the same url pattern, but have different host names.
