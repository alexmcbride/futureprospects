ruby '2.3.3'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7', platform: :ruby
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# group :development, :test do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   gem 'byebug', platform: :mri
# end
#
# group :development do
#   # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
#   gem 'web-console', '>= 3.3.0'
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Authentication
gem 'devise' # authentication
gem 'omniauth-google-oauth2' # google oauth
gem 'omniauth-facebook' # facebook oauth
gem 'omniauth-twitter' # twitter oauth
gem 'rolify' # roles
gem 'pundit' # permissions
gem 'recaptcha', '~> 4.1.0', require: 'recaptcha/rails' # recaptcha

# Layouts
gem 'bootstrap-sass', '~> 3.3.6' # bootstrap
gem 'bootstrap-datepicker-rails' # bootstrap datepicker control
#gem 'devise-bootstrapped' # authentication views (only needed when generating views)
gem 'will_paginate', '~> 3.1.0' # pagination
gem 'redcarpet'  # markdown
gem 'gretel' # breadcrumb
gem 'font-awesome-sass', '~> 4.7.0' # glyphs and icons
gem 'jquery-ui-rails' # jquery-ui (autocomplete)

# Image upload
gem 'carrierwave', '~> 1.0' # image upload
gem 'mini_magick' # Image resizing (requires ImageMagick installed too)
gem 'fog-aws' # Cloud storage (through Amazon Web Services)

# Payments
gem 'braintree' # braintree payments
gem 'activemerchant' # general payments

# Charts, spreadsheets, and PDFs
gem 'prawn' # PDF generation
gem 'chartkick' # chart generation
gem 'groupdate' # makes grouping by dates easier (for charts)
gem 'axlsx' # excel

# Misc
gem 'scoped_search' # search
gem 'figaro' # configuration (for heroku)
gem 'twilio-ruby', '~> 4.11.1' # SMS text messages with Twilio
