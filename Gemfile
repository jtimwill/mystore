source 'https://rubygems.org'
ruby '2.5.1'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'rails', '~> 4.2.7'
gem 'haml-rails' 
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'
gem 'bootstrap_form' 
gem 'bcrypt'
gem 'sidekiq'
gem 'unicorn'
gem 'sentry-raven', :git => "https://github.com/getsentry/raven-ruby.git"
gem 'stripe'
gem 'figaro'
gem 'draper'
gem 'stripe_event'
gem 'bootswatch-rails'
gem 'celluloid', '0.16.0'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'foreman'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails'
  gem 'fabrication'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'capybara'
  gem 'capybara-email'
  gem 'vcr'
  gem 'webmock'
  gem 'selenium-webdriver'
  gem 'database_cleaner', :git => "https://github.com/DatabaseCleaner/database_cleaner"
end

group :production, :staging do
  gem 'rails_12factor'
end
