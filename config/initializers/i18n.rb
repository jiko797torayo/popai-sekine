Rails.application.config.i18n.available_locales = [:ja]

I18n.enforce_available_locales = true
I18n.default_locale = :ja

Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', "**", "*.yml").to_s]
