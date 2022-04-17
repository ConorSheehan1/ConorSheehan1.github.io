---
layout: blog
categories: blog
tags: devto
dev_to: https://dev.to/conorsheehan1/netlify-deployments-from-github-without-giving-write-access-m3f
---

[Netlify](https://www.netlify.com/) is a great hosting service, but there's one thing that bothers me about it. The default deployment path involves giving the service **read *and* write access** to all of your **public *and* private repositories** on GitHub :scream:

https://docs.netlify.com/site-deploys/create-deploys/#deploy-with-git

They skip over the authorization step in the video on their docs, but here's what it looks like.


![Netlify OAuth](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/10y0xw8dha08edpfn6hy.png)

I found [some](https://answers.netlify.com/t/why-do-you-need-write-permissions-to-my-repository/7897) [questions](https://answers.netlify.com/t/new-github-permissions/37939) on their forums asking about this. There's even an open [issue](https://github.com/netlify/netlify-cms/issues/4329) on their GitHub about it. Despite all the links I visited, I didn't find a clear way to automate deploys to Netlify without giving them full access to my GitHub, so here's how I managed to do it.

## Initial drag and drop deploy
Before we can automate our deploys, we need a site ID. Netlify provides a drag and drop feature, so we can drag the output of a build, or even a folder with an empty `index.html` to create a new site. https://app.netlify.com/drop
 
## GitHub action
Now that we have a Netlify site created, we can automate deploys to it. I used https://github.com/jsmrcaga/action-netlify-deploy, which requires an auth token and a site ID.

### Generate auth token
We can generate a Netlify auth token by going to https://app.netlify.com/user/applications#personal-access-tokens. Click `New Access Token`, then give it a description and click `generate`. Copy the value, it won't be displayed again. 

To make the value accessible to the GitHub action, go to your GitHub repository and click `settings` -> `secrets` -> `new repository secret`. I named mine `NETLIFY_AUTH_TOKEN` and pasted in the value I copied from Netlify.

### Get site ID
You can find your Netlify site ID by going to your Netlify site overview and clicking `site settings` and copying the `APP ID`. Again, to make it accessible to the GitHub action, click `settings` -> `secrets` -> `new repository secret`. I named mine `NETLIFY_SITE_ID` and pasted in the value I copied from Netlify.

### GitHub action
Now that we have our secrets set up, we can create our GitHub action. Mine looks something like [this](https://github.com/ConorSheehan1/conors-cocktails/blob/master/.github/workflows/deploy.yml):
```yaml
# .github/workflows/deploy.yml
name: deploy

on:
  # enable manual deploys
  # https://github.blog/changelog/2020-07-06-github-actions-manual-triggers-with-workflow_dispatch/
  workflow_dispatch:
  # deploy tags and commits to master automatically
  push:
    tags:
      - "*"
    branches:
      - "master"

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: "Deploy to Netlify"
    steps:
      - uses: actions/checkout@v2
      - uses: jsmrcaga/action-netlify-deploy@v1.7.2
        with:
          # pass secrets in to the action
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
          # add the GitHub ref to the deploy message so we can trace back what version is deployed from the Netlify side
          NETLIFY_DEPLOY_MESSAGE: "Prod deploy v${{ github.ref }}"
          NETLIFY_DEPLOY_TO_PROD: true
          # this bit should be custom to your project. I'm deploying a vuepress project that uses yarn, so these are my settings.
          install_command: yarn install
          build_command: yarn build
          build_directory: src/.vuepress/dist
          node_version: 14.18.2
```

That's it! Now you can deploy to Netlify automatically from your GitHub repo, and you haven't given up any access rights.

## Example site
I figured this out while building this project [https://github.com/ConorSheehan1/conors-cocktails](https://github.com/ConorSheehan1/conors-cocktails) which is deployed here [https://conorscocktails.netlify.app](https://conorscocktails.netlify.app ) if you're interested.