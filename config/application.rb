# encoding: utf-8
require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module StackoverflowCloneDefinitiveEdition
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    
    # локализация для РФ
    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'
    config.active_record.default_timezone = :local

    # Явно указываем кодировку
    config.encoding = 'utf-8'
  end
end
