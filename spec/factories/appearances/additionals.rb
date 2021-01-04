# frozen_string_literal: true

FactoryBot.define do
  factory :appearance_additionals, class: OneSignal::Appearances::Additionals do
    android_channel_id { 'android_channel_id' }

    initialize_with { new(attributes) }
  end
end
