source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'mime-types'
gem 'mini_magick'
gem 'rmagick'
gem 'carrierwave', '~> 2.2', '>= 2.2.2'
gem 'fog-aws'
gem 'aws-sdk-s3', require: false

gem 'bootstrap', '~> 4.3.1'
gem 'will_paginate-bootstrap4'

gem 'devise'

gem 'pdfkit'
gem 'render_anywhere'
gem 'wkhtmltopdf-binary'

group :development, :test do
    gem 'rubocop', '~> 1.16', require: false
    gem 'rubocop-checkstyle_formatter', require: false
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug', platforms: %i[mri mingw x64_mingw]

    gem 'pry', '~> 0.14.1', require: true
    gem 'pry-byebug', '~> 3.4', require: true
    gem 'pry-rails', '~> 0.3.9', require: true
end

group :development do
    # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
    gem 'listen', '~> 3.5', '>= 3.5.1'
    gem 'web-console', '>= 4.1.0'
    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
