---
layout: post
categories: personal
tags: python osx mac cli

project_title: "osxdocker"
src: https://github.com/ConorSheehan1/osxdocker
live: https://pypi.org/project/osxdocker/
---

I recently published my first python package, [osxdocker](https://pypi.org/project/osxdocker/)!  

I spend a lot of time looking at docker logs day to day. Unfortunately clearing docker logs on OSX/MAC turns out to be... 
[complicated](https://stackoverflow.com/questions/42527291/clear-logs-in-native-docker-on-mac).
The issue stems from docker running on a VM on OSX/MAC. So I built a little python CLI to handle it, with some bash 
completion and error handling.

Then I decided to try to get it on [PyPI](https://pypi.org). It turned out to be a really interesting process. 
* I converted to using [poetry](https://github.com/python-poetry/poetry), after being a longtime [pipenv](https://github.com/pypa/pipenv) user. The main [issue](https://github.com/ConorSheehan1/osxdocker/issues/8) it solved was trying to keep `pyproject.toml` and `Pipfile` in sync. 
* I learned a lot about PyPI, Sphinx, ReadTheDocs, Github Actions, and continuos delivery.

It's still not perfect, but it does what I need, so I'm pretty happy with it for now.
I hope to add to it as I discover more things that are specifically tricky on OSX.
