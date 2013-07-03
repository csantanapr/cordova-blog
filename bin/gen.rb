# Generate site from www into public
pub_directory = 'www'


# LessCSS
system( "lessc www/css/_master.less > " + pub_directory + "/css/master.css" )


# Build Blog First using jekyll it blows up the public directory
system( "jekyll build" )



