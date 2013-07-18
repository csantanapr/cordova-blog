Cordova Website
===============


Dependencies
------------

- Jekyll
- See `Gemfile` for more details, and below on how to install.

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
    # can be opened using:
    $ rake serve


Where to make changes
----------------------
The files that are served by cordova.apache.org live in public/.

"rake build" uses lesscss & jekyll to compile some files from www/ into public/

Some files live only in public/, and changes to them should be made directly. The
list of these can be found in _config.yml.

How to update the docs
----------------------

    # render the docs following the directions in the `cordova-docs` repository.
    $ cd /path/to/cordova-docs
    $ ./bin/generate

    # copy the rendered docs from `cordova-docs` to `cordova-website`
    $ rm -r /path/to/cordova-website/public/docs
    $ cp -r /path/to/cordova-docs/public/ /path/to/cordova-website/public/docs

    # update the "Documentation" URL on the site to point to the latest version of the docs
    $ vi _config.yml
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

After running "rake build", run "svn status". You'll notice it looks like:

~       public/blog/2013
M       public/blog/index.html

To fix the ~, run the following commands:

svn update --depth files --force public/blog/*
svn update --depth files --force public/blog/*/* public/blog/*/*/*

