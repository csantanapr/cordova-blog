Cordova Website
==========================


Dependencies
-----------------------

- Mustache for Ruby
- LessCSS
- Json
- See `Gemfile` for more details, and below on how to install these.


How to compile the site
-----------------------

- from commandline, set `cd` to your `cordova-website` repo directory.
- run `sudo gem install bundler` if bundler isn't already installed.
- run `sudo bundle install` (only the first time, or whenever the Gemfile is
  updated).
- run `rake build` to generate the site.
- the site will be generated in `public` folder with an index.html file which 
  you can open as a local file in your browser.


Updating the docs
-----------------------

- render the docs following the directions under the `cordova-docs` repository.
- copy the rendered docs from (`cordova-docs/public/`) to `public/docs`.
- commit your changes.


Things you should know
-----------------------

- `bin/config.json` + `www/template.html` + Mustache outputs `index.html`
- `bin/config.json` contains information for: download & archives, quick links, and list of repos
- the site can be tested by running `www` locally. This is handy for modifying css
