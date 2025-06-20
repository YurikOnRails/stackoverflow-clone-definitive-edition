# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module StackoverflowCloneDefinitiveEdition
  class Application < Rails::Application
    config.load_defaults 8.0


    config.autoload_lib(ignore: %w(assets tasks))
    config.i18n.default_locale = :en
    config.i18n.available_locales = [ :en ]
    config.i18n.fallbacks = [ :en ]
    config.time_zone = "Moscow"
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false
    end
  end
end
