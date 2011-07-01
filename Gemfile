source 'http://rubygems.org'

gem 'thin'
gem 'rails', '3.1.0.rc4'
gem 'compass', :require => false

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'ancestry'
gem 'table_builder', '0.0.3', :git => 'git://github.com/jchunky/table_builder.git'
gem 'simple_form'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'sqlite3'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem 'pg' # Postgres
  gem 'therubyracer-heroku', '0.8.1.pre3'
end
