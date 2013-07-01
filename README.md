Cordova Website
===============


Dependencies
------------

- Mustache for Ruby
- LessCSS
- JSON
- See `Gemfile` for more details, and below on how to install these.
- JekyLL

Get the source code
-------------------

    $ svn checkout https://svn.apache.org/repos/asf/cordova/site cordova-website


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


How to update the docs
----------------------

    # render the docs following the directions in the `cordova-docs` repository.
    $ cd /path/to/cordova-docs
    $ ./bin/generate

    # copy the rendered docs from `cordova-docs` to `cordova-website`
    $ rm -r /path/to/cordova-website/public/docs
    $ cp -r /path/to/cordova-docs/public/ /path/to/cordova-website/public/docs

    # update the "Documentation" URL on the site to point to the latest version of the docs
    $ vi bin/config.json
        search for "Documentation"
        change the version number in the URL to the latest (likely what you added above)

    # compile the site per the instructions above, since the URL to the docs changed thus the page needs to be re-generated

    # commit your changes to SVN
    $ svn add public/docs/
    $ svn commit -m "Add docs version 2.5.0."


How to deploy the website
-------------------------

- the website is automatically updated on each commit.
- the website should update within seconds.


Things you should know
----------------------

- `bin/config.json` + `www/template.html` + Mustache outputs `index.html`
- `bin/config.json` contains information for: download & archives, quick links, and list of repos
- the site can be tested by running `www` locally. This is handy for modifying css
