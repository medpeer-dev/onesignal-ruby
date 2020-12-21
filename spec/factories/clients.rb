# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: OneSignal::Client do
    app_id { 'app_id' }
    api_key { 'api_key' }
    api_url { 'http://api_url' }
    open_timeout { 60 }
    read_timeout { 60 }

    initialize_with { new(app_id, api_key, api_url, open_timeout, read_timeout) }
  end
end
