# frozen_string_literal: true

FactoryBot.define do
  factory :grouping, class: OneSignal::Grouping do
    android_group { 'groupkey' }
    android_group_message { 'This is grouped message' }

    initialize_with { new(attributes) }
  end
end
