# Run via "rake build"

# LessCSS
system( "lessc css/_master.less > public/css/master.css" )

# Build Blog First using jekyll it blows up the public directory
system( "jekyll build" )




