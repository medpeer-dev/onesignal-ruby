# frozen_string_literal: true

FactoryBot.define do
  factory :badge, class: OneSignal::Badge do
    ios_badgeType { 'SetTo' }
    ios_badgeCount { 1 }

    initialize_with { new(attributes) }
  end
end
