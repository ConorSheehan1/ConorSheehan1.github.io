[![Build Status](https://travis-ci.org/ConorSheehan1/ConorSheehan1.github.io.svg?branch=master)](https://travis-ci.org/ConorSheehan1/ConorSheehan1.github.io)

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
    bundle exec rspec
    ```


## Configuration
1. All pages should use the default layout or a layout which inherits from the default layout.  
This is because the default layout loads all css/js required by pages.
1. Lightbox.min.css is customized to look for images in /images/lightbox/ instead of /images/
1. Pagination only works from index.html pages, hence the need for projects/index.html
1. For jekyll plugins on github pages, the plugin must be included in both _config.yml and Gemfile


## Credit
Jekyll theme: https://github.com/pages-themes/midnight
