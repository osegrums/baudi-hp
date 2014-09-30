source 'https://rubygems.org'
source 'https://rails-assets.org'
# ruby '2.1.3'

gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass'
gem 'devise'
gem 'devise-i18n'
gem 'high_voltage'
gem 'font-awesome-rails'

# Database
gem 'pg'

gem 'annotate', '~> 2.6.5'

# File uploads
gem 'carrierwave'
gem 'carrierwave-processing'
gem 'mini_magick'

gem 'bootsy'
gem 'rails-assets-blueimp-gallery'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'hub', require: false
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-bundler'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
end

group :production do
  gem 'puma', require: false
  gem 'puma_worker_killer', require: false
  gem 'rails_12factor'
end
