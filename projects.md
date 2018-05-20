---
layout: default
---


## Things I've made
------------------------------------------------------------------------------------------------------

* [chrome-compare](https://chrome.google.com/webstore/detail/chrome-compare/fbojbhlkngpihcjhjhadacdfikocgjfe) 
  * A google-chrome extension to compare the same page accross multiple sites (js) 
  * [View Source Code](https://github.com/ConorSheehan1/chrome-compare)

* [https://conorsgapminder.herokuapp.com](https://conorsgapminder.herokuapp.com) 
  * visualization of GDP and life expectancy of countries (d3.js) 
  * [View Source Code](https://github.com/ConorSheehan1/InfoVisD3)
  
* [https://conorsworldmap.herokuapp.com](https://conorsworldmap.herokuapp.com)
  * visualization of GDP grouped by government type, using (d3.js, datamaps)  
  * [View Source Code](https://github.com/ConorSheehan1/InfoVisD3)



## College Projects
------------------------------------------------------------------------------------------------------  

{% for project in site.data.projects.college %}
  * {{project.title}}
  * [View Site]({{site.live}})
  * [View Source Code]({{project.src}})

  {% for image in site.data.images.projects[project.id] %}
    [![{{ image[1].alt }}]({{image[1].src}})]({{image[1].src}})
  {% endfor %}

{% endfor %}

