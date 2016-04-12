require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-CN'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.test_framework = :minitest
    config.template_engine = :slim

    # generator
    config.generators do |g|
      g.test_framework :minitest
      g.helper false
      g.template_engine :slim
      g.javascripts false
      g.javacript_engine :coffee
    end

    # middleware config
    config.middleware.use ActionDispatch::RemoteIp
    config.middleware.use ActiveRecord::QueryCache

    # controller
    config.action_controller.perform_caching = false

    #auto load path
    config.autoload_paths += %W(#{config.root}/lib/validators)

    # ActiveRecord
    config.active_record.logger = Logger.new(Rails.root.join('log', Rails.env + '.log'), 'daily')
  end
end
