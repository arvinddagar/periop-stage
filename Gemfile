require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.11'
group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'bootstrap-sass', '~> 2.3.2.0'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end
gem 'jquery-rails'
gem "haml", ">= 3.1.5"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
gem "database_cleaner", ">= 0.7.2", :group => :test
gem "mongoid-rspec", ">= 1.4.4", :group => :test
gem "factory_girl","~> 4.0", :group => [:development, :test,:production],:require => false
gem "factory_girl_rails", ">= 3.3.0", :group => [:development, :test,:production],:require => false
gem "faker", :group => [:development, :test,:production]
gem "email_spec", ">= 1.2.1", :group => :test
gem "guard", ">= 0.6.2", :group => :development
gem "roo"
gem "json", " >= 1.7.7"
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "bson_ext", ">= 1.6.2"
gem "mongoid", ">= 2.4.10"
gem "devise", ">= 2.1.3"
gem "will_paginate_mongoid"
gem "therubyracer", :group => :assets, :platform => :ruby
gem "simple_form"

gem "select2-rails"

group :production do
  gem 'thin'
end

group :test do
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  # gem 'capybara', '>= 1.1.2'
  # gem 'capybara-webkit'
  # gem 'capybara-screenshot'
end

gem "heroku"
gem "cancan"

gem "heroku-mongo-backup" ,github: 'akhitev/heroku-mongo-backup'
gem "fog"
gem "bootstrap-datepicker-rails"

gem "newrelic_rpm", " >= 3.5.3.25"
gem "browser", '>= 0.2.0'
gem 'validates_timeliness', '~> 3.0'

gem 'exception_notification'

group :development do
  gem 'brakeman', :require => false
  gem 'pry'
end


