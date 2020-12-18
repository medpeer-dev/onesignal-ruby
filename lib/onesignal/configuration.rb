# frozen_string_literal: true

require 'logger'

module OneSignal
  class Configuration
    attr_accessor :app_id, :api_key, :api_url, :active, :logger, :open_timeout, :read_timeout

    def initialize
      @app_id = ENV['ONESIGNAL_APP_ID']
      @api_key = ENV['ONESIGNAL_API_KEY']
      @api_url = "https://onesignal.com/api/#{OneSignal::API_VERSION}"
      @active = true
      @logger = Logger.new(STDOUT).tap do |logger|
        logger.level = Logger::INFO
      end
      @open_timeout = 60
      @read_timeout = 60
    end
  end
end
