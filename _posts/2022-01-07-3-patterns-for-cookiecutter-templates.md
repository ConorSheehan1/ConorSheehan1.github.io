---
layout: blog
categories: blog
dev_to: https://dev.to/conorsheehan1/3-patterns-for-cookiecutter-templates-aha
---
<!-- Original Post on dev.to was 2021-07-27 -->

## Intro
If you've heard of [cookiecutter](https://github.com/cookiecutter/cookiecutter) you can skip this part.

Cookiecutter is a command-line utility that creates projects from templates. There's a list of [templates maintained by the cookiecutter team](https://github.com/cookiecutter/cookiecutter#cookiecutter-specials) and plenty of  [community awesome lists](https://awesomeopensource.com/projects/cookiecutter). It's built with [python](https://www.python.org/) and uses the [jinja](https://github.com/pallets/jinja) templating framework (found in python web frameworks like [flask](https://flask.palletsprojects.com)). You can use it to make a template for pretty much anything! All you need to get started is `pip install cookiecutter`.


## Hooks
Cookiecutter provides [pre and post generate scripts](https://cookiecutter.readthedocs.io/en/1.7.3/advanced/hooks.html). They are Python or Shell scripts that run before and/or after your project is generated.

They can be really useful. For example, if you want to get the absolute path to the generated project, you can use a post generate script to replace a specific piece of text with the absolute path. e.g.

```python
# cookiecutter-$your-project/hooks/post_gen_project.py 
abs_path = os.getcwd()

for root, dirs, files in os.walk(abs_path):
    for filename in files:
        with open(os.path.join(root, filename)) as f:
            content = f.read()
        content = content.replace('replace_me.base_dir', abs_path)
        with open(os.path.join(root, filename), 'w') as f:
            f.write(content)
```

Here's an [example in a cookiecutter I made](
https://github.com/ConorSheehan1/cookiecutter-jira-project/blob/master/hooks/post_gen_project.py#L3). 
See https://github.com/cookiecutter/cookiecutter/issues/955#issuecomment-444864537

## Tests
There are a few ways to test cookiecutters.
### Putting tests inside the template
This approach has the advantage that when someone generates a project using your template, they already have tests set up. e.g.
 
```python
# {{cookiecutter.repo_name}}/{{cookiecutter.repo_name}}.py
__version__ = "0.1.0"


def {{cookiecutter.repo_name}}(version=False):
    if version:
        return __version__
    else:
        # do some cli stuff
```
```python
# {{cookiecutter.repo_name}}/tests/test_{{cookiecutter.repo_name}}.py 
import unittest

class Test{{cookiecutter.repo_name}}(unittest.TestCase):
    def test_version(self):
        assert {{cookiecutter.repo_name}}(version=True) == "0.1.0"
```

Here's an [example in a cookiecutter I made](https://github.com/ConorSheehan1/cookiecutter-fire-cli/blob/621b635c23407b9704bcce322390dbebbc544ca3/%7B%7Bcookiecutter.repo_name%7D%7D/tests/test_%7B%7Bcookiecutter.repo_name%7D%7D.py#L1).

### Putting tests outside the template
This approach is useful if it doesn't make sense to include tests in the generated project, but you still want to test what is generated. Note: this doesn't mean trying to test cookiecutter itself!

Normally Cookiecutter opens a prompt to get user input to be injected into your template. You can bypass this with the `--no-input` argument. It also allows you to [pass values required by `cookiecutter.json` as arguments](https://github.com/cookiecutter/cookiecutter/pull/666). e.g.

```json
// cookiecutter-$your-project/cookiecutter.json
{
  "project_name": "alphabet",
}
```
```bash
# this will generate a project named foo instead of alphabet
cookiecutter . --no-input project_name="foo"
```

I've used this approach when creating cookiecutters that contain scripts rather than full projects. To test the scripts I generate a project, import and run functions from the scripts, and test the output. e.g.

```bash
# cookiecutter-$your-project/{{cookiecutter.project_name|lower}}/script.sh
#!/bin/bash

{{cookiecutter.project_name|lower}}_repo_dir="{{cookiecutter.repo_dir}}"

goto_{{cookiecutter.project_name|lower}}_repo() {
  cd "${{cookiecutter.project_name|lower}}_repo_dir" || return 1
}
```
```bash
# cookiecutter-$your-project/tests/test_helper.bash
setup() {
    # we expect foo/script.sh to be generated
    load "foo/script.sh"
}
```
```bash
# cookiecutter-$your-project/tests/script.bats
#!/usr/bin/env bats

load "test_helper"

# we expect a function named goto_foo_repo in foo/script.sh
@test "goto_foo_repo" {
  goto_foo_repo
  assert_equal "$foo_repo_dir" "$PWD"
}
```

Here's an [example in a cookiecutter I made](https://github.com/ConorSheehan1/cookiecutter-jira-project/blob/60e341060198a4d8937095b6c2e53f545d1ff58f/tests/utils.bats#L8).

### CI
Now that you have tests set up, you can set up continuous integration! The important bit of here is
```yaml
cookiecutter 
. # create a project using the current directory as a template
--overwrite-if-exists # if the destination directory exists overwrite it
--no-input # don't prompt for user input. 
# since there are no other args, use default values from cookiecutter.json
```

Here's an example with github actions
```yaml
# .github/workflows/ci.yml
name: ci

jobs:
  build:

    runs-on: macos-latest
    strategy:
      matrix:
        python: [3.6, 3.7, 3.8]

    steps:
      - uses: actions/checkout@v1
      - name: Set up Python ${{ matrix.python }}
        uses: actions/setup-python@v1
        with:
          python-version: ${{ matrix.python }}
      - name: Install Poetry
        run: |
          python -m pip install --upgrade pip
          pip install poetry
      - name: Install python packages
        run: |
          poetry install
      # here's the important bit!
      # generate a new project using the cookiecutter template
      # use the default values in cookiecutter.json with --no-input
      # if the directory already exists, overwrite it
      - name: Generate package using cookiecutter
        run: |
          poetry run cookiecutter . --overwrite-if-exists --no-input
      # now inside the generated project, install dependencies and run tests
      - name: Install python packages (in cookiecutter dir)
        working-directory: example_cli
        run: |
          poetry install
      - name: Run tests (in cookiecutter dir)
        working-directory: example_cli
        run: |
          poetry run task tests
```

Here's an [example in a cookiecutter I made](https://github.com/ConorSheehan1/cookiecutter-fire-cli/blob/621b635c23407b9704bcce322390dbebbc544ca3/.github/workflows/ci.yml#L1).

## Install from GitHub
Cookiecutter provides a [really easy way to use templates hosted on github](https://cookiecutter.readthedocs.io/en/1.7.3/usage.html#works-directly-with-git-and-hg-mercurial-repos-too). All you need is `cookiecutter gh:$username/$repo`

Hopefully now you should be able to create a Cookiecutter template with hooks, tests, and CI, all easily installable from GitHub!