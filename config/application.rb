# encoding: utf-8
# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module StackoverflowCloneDefinitiveEdition
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w(assets tasks))

    # Локализация
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [ :ru, :en ]
    config.i18n.fallbacks = [ :ru ]
    config.time_zone = "Moscow"
    config.active_record.default_timezone = :local

    # Явно указываем кодировку
    config.encoding = "utf-8"

    # Загружаем локали из вложенных директорий
    config.i18n.load_path += Rails.root.glob("config/locales/**/*.{rb,yml}")
  end
end
