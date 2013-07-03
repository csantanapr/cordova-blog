Cordova Website
===============

Dependencies
------------

- Jekyll

Get the source code
-------------------

    $ git clone https://github.com/csantanapr/cordova-blog cordova-website

How to add a post to the Cordova Blog
-----------------------
    # Add Markdown or Textile file into www/_posts/YEAR-MONTH-DAY-title.MARKUP
      For example:
      2011-12-31-new-years-eve-is-awesome.md
      2012-09-12-how-to-write-a-blog.textile
    $ echo "my new blog post" > www/_posts/2013-12-31-cordova-is-awesome.md

    # Switch to gh-pages branch
    $ git checkout gh-pages

    # Preview Blog Post
    $ jekyll serve --baseurl ''

    # Add and commit
    $ git commit -a -m "My new blog post"



How to build the site
-----------------------

    # change to the cordova website directory.
    $ cd /path/to/cordova-website

    # install bundler if it isn't already installed.
    $ sudo gem install bundler

    # update project gems.
    # only the first time or when the Gemfile is updated.
    $ sudo bundle install

    # build and serve the site.
    $ jekyll serve --baseurl ''

    # Test
    # the site is generated in `_site/`
    # can be preview with http://localhost:4000/


How to update GitHub Pages
----------------------

    # Switch to master branch

    # Make changes in www, compile site, and test
    $ rake build

    # Add and commit changes to master branch

    # Record changes www to tmp
    $ cp -r www/* ../wwwtmp/

    # Switch to gh-pages
    $ git checkout gh-pages

    # Copy in recorded changes
    $ cp -r ../wwwtpm/* .


    # Add and commit
    $ git commit -a -m "My new post added"

    # Commit changes to gh-pages
    $ git push origin gh-pages


How to deploy the website
-------------------------

- the website is automatically updated on each commit.
- the website should update within seconds.

Things you should know
----------------------

- `_config.yml` contains information for: download & archives, quick links, and list of repos
- the site can be tested by running `public` locally using http://localhost. This is handy for modifying css

