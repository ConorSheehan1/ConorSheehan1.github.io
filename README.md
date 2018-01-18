## Local setup
1. install dependencies
    ```
    bundle
    ```
1. run server
    ```
    bundle exec jekyll serve
    ```  
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


## Credit
Jekyll theme: https://github.com/pages-themes/midnight
