# frozen_string_literal: true

module OneSignal
  class Grouping
    attr_reader :android_group, :android_group_message

    def initialize android_group: nil, android_group_message: nil
      @android_group = android_group
      @android_group_message = android_group_message
    end

    def as_json options = nil
      {
        'android_group' => @android_group,
        'android_group_message' => @android_group_message
      }
    end
  end
end
