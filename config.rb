###
# Blog settings
###

Time.zone = 'Asia/Tokyo'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = 'blog'

  blog.permalink = 'posts/{number}.html'
  # Matcher for blog source files
  blog.sources = 'posts/{number}.html'
  blog.taglink = 'tags/{tag}.html'
  blog.tag_template = 'tag.html'
  # blog.categorylink = 'categories/{category}.html'
  # blog.category_template = 'category.html'
  blog.layout = 'layout/article'
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.default_extension = '.md'


  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

activate :directory_indexes
set :trailing_slash, false

ignore '/layout/article.html'

page '/feed.xml', layout: false

set :site_url, 'http://blog-test.fukayatsu.com/'
set :site_author, 'esa team'
set :site_title, 'esa blog'
set :site_subtitle, 'Expertise Sharing Archives for motivated teams.'


###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

helpers do
  def full_url(path)
    URI.join(config[:site_url], URI.escape(path))
  end
end

require 'lib/custom_emoji'
require 'lib/html_pipeline_template'
set :markdown_engine, :HtmlPipeline

set :haml, { ugly: true }

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
