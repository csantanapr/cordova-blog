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
    # Add Markdown pr Textile file into www/_posts/YEAR-MONTH-DAY-title.MARKUP
    # For example:
    # 2011-12-31-new-years-eve-is-awesome.md
    # 2012-09-12-how-to-write-a-blog.textile

How to compile the site
-----------------------

    # change to the cordova website directory.
    $ cd /path/to/cordova-website

    # install bundler if it isn't already installed.
    $ sudo gem install bundler

    # update project gems.
    # only the first time or when the Gemfile is updated.
    $ sudo bundle install

    # compile the site.
    $ rake build

    # the site is generated in `public/` with an index.html file that
    # can be opened as a local file in your browser.
    $ open public/index.html


How to update GitHub Pages
----------------------

    # Make changes in www, compile site, and test

    # Stage changes
    $ git add www

    # Stash changes
    $ git stash

    # Switch to gh-pages
    $ git checkout gh-pages

    # Apply saved stash
    $ git stash apply

    # Stage changes into branch
    $ git add .

    # Commit changes to gh-pages
    $ git push origin gh-pages


How to deploy the website
-------------------------

- the website is automatically updated on each commit.
- the website should update within seconds.
