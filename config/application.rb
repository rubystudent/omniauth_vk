# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OmniauthVk
  class Application < Rails::Application
  end
end

Rails.application.secrets.each { |key, value| ENV[key.to_s] ||= value }
