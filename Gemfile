source 'https://rubygems.org'

ruby "2.4.1"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

gem 'actionview-encoded_mail_to'
# This was required to use Draper under Rails 5
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
gem 'awesome_nested_set'
gem 'aws-sdk', '~> 2'
gem 'carmen'
gem 'dalli'
gem 'devise'

# Had to specify repo due to problems with Rails 5
gem 'draper'
gem 'flickraw'
gem 'font-awesome-rails'
gem 'foundation-icons-sass-rails'
gem 'foundation-rails', '6.3'
gem 'friendly_id'
gem 'haml'
gem 'haml-rails'
gem 'jplayer-rails'
gem 'newrelic_rpm'
gem "nilify_blanks"
# Dependencies on this gem broke deployment after a bundler update,
# so pinning the gem to an earlier version.
gem "nokogiri", "1.6.8"
gem "paperclip", "~> 5.1.0"
gem 'pdfkit'
gem 'pundit'
gem 'rack-mini-profiler', require: false
gem 'whenever', require: false
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# gem 'wkhtmltopdf-binary-edge', '~> 0.12.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'better_errors'
  gem 'byebug'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm', '~> 0.0.3'

  # gem 'quiet_assets'
end

group :development do
  # gem 'capistrano-shortcuts', path: '/Users/todd/Sites/capistrano-shortcuts', require: false
  gem 'capistrano-shortcuts', "~> 0.5.1", require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
