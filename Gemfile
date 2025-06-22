# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "vite_rails"
gem "slim-rails"
gem "devise"
gem "tzinfo-data", platforms: %i(windows jruby)
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-packaging", require: false
  gem "rubocop-thread_safety", require: false
  gem "debug", platforms: %i(mri windows), require: "debug/prelude"
  gem "brakeman", require: false
  gem "rspec-rails", "~> 8.0.1"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "bullet"
  gem "simplecov", require: false
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "capybara-screenshot"
  gem "vcr"
  gem "webmock"
  gem "rspec-wait"
  gem "shoulda-matchers"
  gem "launchy"
  gem "rails-controller-testing"
end
