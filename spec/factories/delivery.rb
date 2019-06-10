# frozen_string_literal: true

FactoryBot.define do
  factory :delivery, class: OneSignal::Delivery do
    send_after { 'Thu Sep 24 2015 14:00:00 GMT-0700 (PDT)' }
    delayed_option { 'timezone' }
    delivery_time_of_day { '21:45' }
    ttl { 259200 }
    priority { 10 }

    initialize_with { new(attributes) }
  end
end
