---
layout: blog
categories: blog
tags: devto
dev_to: https://dev.to/conorsheehan1/add-bootstrapvue-to-vuepress-3h7g
---

## Create a VuePress project

The first thing we need to do is create a new [VuePress](https://vuepress.vuejs.org/) project. It's really easy with the latest version of npm or yarn. From the [VuePress docs](https://vuepress.vuejs.org/guide/getting-started.html#quick-start)

```bash
yarn create vuepress-site $optionalDirectoryName
```

## Install BootstrapVue

Next we install [BootstrapVue](https://bootstrap-vue.org)
```bash
yarn add bootstrap bootstrap-vue
```

## Configuration
Now we need to import BootstrapVue in `.vuepress/enhanceApp.js`, where we have access to the vue instance.

```javascript
// .vuepress/enhanceApp.js
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

export default ({ Vue, options, router, siteData }) => {
  // Make BootstrapVue available throughout your project
  Vue.use(BootstrapVue);
  // Optionally install the BootstrapVue icon components plugin
  Vue.use(IconsPlugin);
}
```

Finally we need to load the bootstrap css. VuePress ships with [stylus](https://stylus-lang.com/) by default now, but we can still import css into our stylus file at `.vuepress/styles/index.styl`

```stylus
/**
 * Custom Styles here.
 *
 * ref：https://v1.vuepress.vuejs.org/config/#index-styl
 */

@require '~bootstrap/dist/css/bootstrap.css'
@require '~bootstrap-vue/dist/bootstrap-vue.css'
```

That's it! Now you can use BootstrapVue components in your VuePress app. 

## Example
Vuepress lets you embed components directly in markdown, so you can do something like this
```md
<!-- src/index.md -->
## Hi from bootstrap-vue
<b-button>Hello world!</b-button>
```

Here's an example app I've deployed to netlify which uses various BootstrapVue components including `b-carousel` and `b-table`: [https://conorscocktails.netlify.app/](https://conorscocktails.netlify.app/)

You can find the sourcecode here: [https://github.com/ConorSheehan1/conors-cocktails](https://github.com/ConorSheehan1/conors-cocktails)