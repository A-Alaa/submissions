# encoding: UTF-8
begin
  config = YAML.load_file("#{Rails.root}/config/config.yml")

  ::AppConfig = config
  ActionMailer::Base.smtp_settings = config[:smtp_settings]
  ActionMailer::Base.default_url_options[:host] = config[:host]

  module ActionView
    module Helpers
      module FormOptionsHelper
        SUPPORTED_LANGUAGES = [['Português', 'pt'], ['English', 'en']]
      end
    end
  end
rescue
  raise "config/config.yml file not found. Please check config/config.example for a sample"
end
