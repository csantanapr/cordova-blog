$LOAD_PATH.unshift File.dirname( __FILE__ ) + '/../lib'
require 'mustache'
require 'rubygems'
require 'json'
require 'ftools'
require 'fileutils'

class TemplateIndex < Mustache
  self.template_file = File.dirname( __FILE__ ) + '/../www/_template-index.html'
end

class TemplateArtwork < Mustache
  self.template_file = File.dirname( __FILE__ ) + '/../www/_template-artwork.html'
end

tempIndex = TemplateIndex.new
tempArt = TemplateArtwork.new
json_file = File.dirname( __FILE__ ) + '/config.json';
data = JSON.parse( IO.read( json_file ) )

# download button and archives
releases = data['releases']
if releases.length > 0
    latest_item = releases[0]
    archives = releases.slice(1, releases.length)
    len = archives.length;
    column_len = ( len / 3.0 ).ceil
    tempIndex[:download_set1] = archives.slice( 0, column_len )
    tempIndex[:download_set2] = archives.slice( column_len, column_len )
    tempIndex[:download_set3] = archives.slice( column_len*2, column_len )
    tempIndex[:latest_version] = latest_item['version']
    tempIndex[:download_link] = latest_item['file']
    tempIndex[:hide_archives] = len == 0
else
    tempIndex[:hide_archives] = true
    tempIndex[:no_download] = true
end

# list of repos
repos = data['repos']
tempIndex[:repo_platforms] = repos['platforms']
tempIndex[:repo_platforms][0]['first'] = true
tempIndex[:repo_other] = repos['other']
tempIndex[:repo_other][0]['first'] = true

# quicklinks / sitemap
sitemap = data['sitemap']
tempIndex[:links_general] = tempArt[:links_general] = sitemap['general']
tempIndex[:links_dev] = tempArt[:links_dev] = sitemap['dev']
tempIndex[:links_asf] = tempArt[:links_asf] = sitemap['asf']

# Generate site

pub_directory = 'public'

# Build Blog First using jekyll it blows up the public directory
system( "jekyll build" )


# generating index.html
File.open( pub_directory + '/index.html', 'w' ) do | file |
    file_data = tempIndex.render( data )
    file_data = file_data.gsub( /(\r|\n)<\![\s-]{0,5}localstart[^*]+?localend[\s-]{0,5}>|<!--\spublicstart[^<]+|\spublicend[^*]+?-->/, '' )
    file.puts tempIndex.render( file_data )
end

# generating artwork.html
File.open( pub_directory + '/artwork.html', 'w' ) do | file |
    file_data = tempArt.render( data )
    file_data = file_data.gsub( /(\r|\n)<\![\s-]{0,5}localstart[^*]+?localend[\s-]{0,5}>|<!--\spublicstart[^<]+|\spublicend[^*]+?-->/, '' )
    file.puts tempArt.render( file_data )
end


# LessCSS
system( "lessc www/css/_master.less > " + pub_directory + "/css/master.css" )

# remove unnecessary files
delete_files = ['/template.html', '/js/less-1.1.5.min.js', 'master.less']
for i in delete_files
    File.delete( pub_directory+i ) unless !File.exists?( pub_directory+i )
end



