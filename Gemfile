source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17.1'
gem 'postgres_ext', '~> 2.2.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'carrierwave', '~> 0.9.0'
gem 'rmagick', '~> 2.13.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn', '~> 4.8.2'

# Use wicked for wizard forms
gem 'wicked'
# Use forgery for seed data creation
gem 'forgery', '~> 0.5.0'
# Use tablecloth for view table creation
gem 'table_cloth', :github => "bobbytables/table_cloth"
# Use Draper for view models aka decorators
gem 'draper', '~> 1.3'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bootstrap-sass', '~> 3.1.0'
gem 'sass-rails', '~> 4.0.1'


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails_layout'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spork-rails'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'childprocess'
  gem 'factory_girl_rails'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'
  gem 'cucumber', '1.2.5'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

