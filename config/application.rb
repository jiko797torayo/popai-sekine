require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PopaiSekine
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.paths.add 'uploaders', eager_load: true

    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end

    # Sentry
    Raven.configure do |config|
      config.dsn = "https://#{ENV['RAVEN_KEY']}@sentry.io/#{ENV['RAVEN_PROJECT_ID']}"
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
      config.environments = %w[production]
    end
  end
end
