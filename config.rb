###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
Time.zone = "America/Denver"

###



activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

# add build files to a temp directory
set :build_dir, 'build'



configure :production do
  activate :s3_sync do |s3_sync|
    s3_sync.bucket                     = 'www.audaciousinsight.com' # The name of the S3 bucket you are targetting. This is globally unique.
    s3_sync.region                     = 'us-west-2'     # The AWS region for your bucket.
    #   s3_sync.aws_access_key_id          = 'AWS KEY ID'
    #   s3_sync.aws_secret_access_key      = 'AWS SECRET KEY'
    #   s3_sync.delete                     = false # We delete stray files by default.
    #   s3_sync.after_build                = false # We do not chain after the build step by default.
    #   s3_sync.prefer_gzip                = true
    #   s3_sync.path_style                 = true
    #   s3_sync.reduced_redundancy_storage = false
    #   s3_sync.acl                        = 'public-read'
    #   s3_sync.encryption                 = false
    #   s3_sync.prefix                     = ''
    #   s3_sync.version_bucket             = false
    s3_sync.index_document             = 'index.html'
    s3_sync.error_document             = '404.html'
  end
end