#!/usr/bin/env ruby

# Generate site from www into public
pub_directory = 'www'


# LessCSS
system( "lessc www/css/_master.less > " + pub_directory + "/css/master.css" )


puts "Server running at http://localhost:4000/'"
system( "jekyll serve --watch --baseurl ''" )





