# frozen_string_literal: true

require 'faraday'

module OneSignal
  class Client
    class ApiError < RuntimeError; end

    def initialize app_id, api_key, api_url, open_timeout, read_timeout
      @app_id = app_id
      @api_key = api_key
      @api_url = api_url
      @conn = ::Faraday.new(url: api_url) do |faraday|
        # faraday.response :logger do |logger|
        #   logger.filter(/(api_key=)(\w+)/, '\1[REMOVED]')
        #   logger.filter(/(Basic )(\w+)/, '\1[REMOVED]')
        # end
        faraday.adapter Faraday.default_adapter
        faraday.options[:open_timeout] = open_timeout
        faraday.options[:timeout] = read_timeout
      end
    end

    def create_notification notification
      post 'notifications', notification
    end

    def fetch_notification notification_id
      get "notifications/#{notification_id}"
    end

    def fetch_players
      get 'players'
    end

    def fetch_player player_id
      get "players/#{player_id}"
    end

    private

    def create_body payload
      body = payload.as_json
      body['app_id'] = @app_id
      body
    end

    def post url, body
      res = @conn.post do |req|
        req.url url
        req.body = create_body(body).to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end

      handle_errors res
    end

    def get url
      res = @conn.get do |req|
        req.url url, app_id: @app_id
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end

      handle_errors res
    end

    def handle_errors res
      errors = JSON.parse(res.body).fetch 'errors', []
      raise ApiError, (errors.first || "Error code #{res.status}") if res.status > 399 || errors.any?

      res
    end
  end
end
