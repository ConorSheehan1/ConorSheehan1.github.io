[![Build Status](https://travis-ci.org/ConorSheehan1/ConorSheehan1.github.io.svg?branch=master)](https://travis-ci.org/ConorSheehan1/ConorSheehan1.github.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Local setup
1. install dependencies
    ```
    bundle install
    ```
1. run server
    ```
    bundle exec jekyll serve
    ```  
    Currently _config.yml is only loded on the initial jekyll serve command.  
    If you change config, restart the jekyll server to read the updated data. 


You may need to run ```bundle update``` to get the latest version of jekyll used by live github pages.  
https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

## Tests 
1. **Set up** [Tutorial](https://gist.github.com/deanmarano/aeae5cd2d357fec1b06e30ead397d4e3)  
    1. [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) is required  
    1. You may also need to add ```require 'yaml'``` to the top of the rack/jekyll.rb file installed by bundler as explained here:
    https://github.com/bry4n/rack-jekyll/issues/8

1. **Run**  

    ```
    # all
    bundle exec rspec

    # feature tests
    bundle exec rspec --tag type:feature

    # data tests (for links etc)
    bundle exec rspec --tag type:data
    ```


## Configuration
1. All pages should use the default layout or a layout which inherits from the default layout.  
This is because the default layout loads all css/js required by pages.
1. Pagination only works from index.html pages, hence the need for projects/index.html.
1. For jekyll plugins on github pages, the plugin must be included in both _config.yml -and Gemfile.

## project structure
1. ```_data/```contains custom data accessable by jekyll e.g. urls, image paths, etc.
1. ```_includes/``` contains partials which can be included in templates.  
1. ```_layouts/``` contains html templates which can be reused in multiple pages.  
1. ```_posts/``` actually contains projects, in markdown format.  
  This is to take advantage of jekylls project pagination plugin.  
  It also means projects must include a date in their file name to be a valid post.  
1. ```_site/``` contains the compiled static pages jekyll renders.  
1. ```assets/``` contains css, js, images, and third party plugins e.g. lightbox, jstree etc.  
1. ```projects/``` contains the html template for rendering the projects home page.   
1. ```scripts/``` contains ruby scripts.     
1. ```spec/``` contains rspec selenium tests.  


## Credit
Jekyll theme: https://github.com/pages-themes/midnight
