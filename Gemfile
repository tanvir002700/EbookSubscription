source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'activerecord-import', '~> 0.18.3'
gem 'bitmask_attributes'
gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'carrierwave', '~> 1.0'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem "haml-rails", "~> 0.9"
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rails', '~> 5.1'
gem 'sass-rails', '~> 5.0'
gem 'tzinfo-data', platforms: %I[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'validates_email_format_of', '~> 1.6', '>= 1.6.3'
gem 'mysql2', '~> 0.3.18'

group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'listen', '~> 3.0.5'
  gem 'nested_scaffold'
  gem 'rails_layout'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# deployment gems
group :development do
  gem 'capistrano', '~> 3.8', '>= 3.8.1'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.2', '>= 1.2.3'
  gem 'capistrano-rails-console', '~> 2.2'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.1'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
