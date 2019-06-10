# frozen_string_literal: true

module OneSignal
  class Delivery
    attr_reader :send_after, :delayed_option, :delivery_time_of_day, :ttl, :priority

    def initialize send_after: nil, delayed_option: nil, delivery_time_of_day: nil, ttl: nil, priority: nil
      @send_after = send_after
      @delayed_option = delayed_option
      @delivery_time_of_day = delivery_time_of_day
      @ttl = ttl
      @priority = priority
    end

    def as_json options = nil
      {
        'send_after' => @send_after,
        'delayed_option' => @delayed_option,
        'delivery_time_of_day' => @delivery_time_of_day,
        'ttl' => @ttl,
        'priority' => @priority
      }
    end
  end
end
