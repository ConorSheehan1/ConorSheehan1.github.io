## Local setup
1. install dependencies
    ```bash
    bundle install
    ```
1. run server
    ```bash
    bundle exec jekyll serve --livereload
    ```

    Currently \_config.yml is only loaded on the initial jekyll serve command.  
    If you change config, restart the jekyll server to read the updated data.

You may need to run `bundle update` to get the latest version of jekyll used by live github pages.  
https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

## Tests 
1. **Set up** [Tutorial](https://gist.github.com/deanmarano/aeae5cd2d357fec1b06e30ead397d4e3)  
    1. [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) is required  
    1. You may also need to add `require 'yaml'` to the top of the rack/jekyll.rb file installed by bundler as explained here:
    https://github.com/bry4n/rack-jekyll/issues/8

1. **Run**  

    ```bash
    # all
    bundle exec rspec

    # feature tests
    bundle exec rspec --tag type:feature

    # data tests (for links etc)
    bundle exec rspec --tag type:data
    ```

## Linting
```bash
# run linter
bundle exec rubocop

# update sourcecode if possible
bundle exec rubocop --auto-correct
```

### Configuration
1. All pages should use the default layout or a layout which inherits from the default layout.  
This is because the default layout loads all css/js required by pages.
1. Pagination only works from index.html pages, hence the need for projects/index.html.
1. For jekyll plugins on github pages, the plugin must be included in both \_config.yml -and Gemfile.
1. Dependencies should be compatible with github pages. see https://pages.github.com/versions/

### project structure
1. `_data/`contains custom data accessible by jekyll e.g. urls, image paths, etc.
1. `_includes/` contains partials which can be included in templates.  
1. `_layouts/` contains html templates which can be reused in multiple pages.  
1. `_posts/` actually contains projects, in markdown format.  
  This is to take advantage of jekylls project pagination plugin.  
  It also means projects must include a date in their file name to be a valid post.  
1. `_site/` contains the compiled static pages jekyll renders.  
1. `assets/` contains css, js, images, and third party plugins e.g. lightbox, jstree etc.  
1. `projects/` contains the html template for rendering the projects home page.   
1. `scripts/` contains ruby scripts.     
1. `spec/` contains rspec selenium tests.  

### Debugging
```jekyll
<pre>
  {{ some_variable | inspect }}
</pre>
```

To debug tests, can switch to non-healdess browser. e.g. `:selenium_headless` -> `:selenium`
in spec/spec_helper.rb

### blog posts
jekyll has issues with curly braces, so copying raw markdown from dev.to may cause formatting errors.
to fix this use the {% raw %}...{% endraw %} syntax.
this can be done in vscode with a find and replace regex:
```
find: \{\{(.*)\}\}
replace: {% raw %}{{$1}}{% endraw %}
```

### Scripts
run `bundle exec ruby scripts/build_images_yml.rb` to generate output for `_data/images.yml`.
e.g. `bundle exec ruby scripts/build_images_yml.rb > _data/images.yml`.  
required so tests know image path and can check they render.