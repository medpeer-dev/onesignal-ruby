# frozen_string_literal: true

module OneSignal
  module IOSBadgeType
    NONE = 'None'
    SET_TO = 'SetTo'
    INCREASE = 'Increase'
  end

  class Badge
    attr_reader :ios_badgeType, :ios_badgeCount

    def initialize ios_badgeType: nil, ios_badgeCount: nil
      @ios_badgeType = ios_badgeType
      @ios_badgeCount = ios_badgeCount
    end

    def as_json options = nil
      {
        'ios_badgeType' => @ios_badgeType,
        'ios_badgeCount' => @ios_badgeCount
      }
    end
  end
end
