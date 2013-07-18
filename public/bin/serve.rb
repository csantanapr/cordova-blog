# Run via "rake serve"

system( "lessc css/_master.less > public/css/master.css" )

puts "Server running at http://localhost:4000/'"
puts "\033[31m*** WARNING: You must run 'rake build' before committing changes. ***"
puts "*** 'rake serve' sets URL paths to point to localhost! ***\033[m"

system( "jekyll serve --watch --baseurl ''" )





