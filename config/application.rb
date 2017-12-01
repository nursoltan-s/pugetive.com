require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

PUGETIVE_CONFIG = YAML.load_file("config/pugetive.yml").with_indifferent_access

module Pugetive
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join("app/models/**/")]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
