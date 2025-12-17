# frozen_string_literal: true

source 'https://rubygems.org'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.3'
gem 'sqlite3', '>= 2.1'
gem 'stimulus-rails'
gem 'turbo-rails'

# Nykyta McDonald - addition
# Imported GEMs
# Using Bootstrap for styling
gem 'bootstrap', '~> 5.3.3'
# Using sassc-rails for Sass support
gem 'sassc-rails'
# Using jquery-rails for jQuery support
gem 'jquery-rails'

# Importing dotenv for API key management
gem 'dotenv-rails'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]

# Nykyta McDonald - addition
# Using bcrypt for password hashing
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'kamal', require: false

gem 'thruster', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'debug', platforms: %i[mri windows]
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'ruby_audit'

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver', '~> 4.39'
end
