require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ActsAsTaggableOn.force_lowercase = true

module Ellesfontlaphoto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.active_job.queue_adapter = :sidekiq

    config.i18n.available_locales = [:en, :fr]
    config.i18n.default_locale = :fr

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
