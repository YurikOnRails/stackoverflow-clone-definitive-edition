# frozen_string_literal: true

source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem "vite_rails" # https://github.com/ElMassimo/vite_rails

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # Rubocop для статического анализа кода [https://github.com/rubocop/rubocop]
  gem "rubocop", require: false

  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
  # Проверка правил упаковки гемов [https://github.com/utkarsh2102/rubocop-packaging]
  gem "rubocop-packaging", require: false
  # Проверка потокобезопасности [https://github.com/rubocop/rubocop-thread_safety]
  gem "rubocop-thread_safety", require: false
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # RSpec для тестирования Ruby on Rails приложений [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 6.1.0"

  # Создание тестовых данных [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails"

  # Генерация фейковых данных [https://github.com/ffaker/ffaker]
  gem "ffaker"

  # Обнаружение N+1 запросов [https://github.com/flyerhzm/bullet]
  gem "bullet"

  # Проверка покрытия кода тестами [https://github.com/simplecov-ruby/simplecov]
  gem "simplecov", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Отладка и профилирование производительности [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  # Создание и управление скриншотами в тестах [https://github.com/mattheworiordan/capybara-screenshot]
  gem "capybara-screenshot"

  # Мокирование и запись HTTP запросов [https://github.com/vcr/vcr]
  gem "vcr"

  # Мокирование HTTP запросов [https://github.com/bblimke/webmock]
  gem "webmock"

  # Тестирование асинхронного поведения [https://github.com/rspec/rspec-wait]
  gem "rspec-wait"

  # Матчеры для тестирования моделей и валидаций [https://github.com/thoughtbot/shoulda-matchers]
  gem "shoulda-matchers"
end
