# frozen_string_literal: true

module OneSignal
  module Appearances
    class Additionals
      attr_reader :android_channel_id

      def initialize params
        @android_channel_id = params[:android_channel_id]
      end

      def as_json options = nil
        {
          'android_channel_id' => android_channel_id
        }
      end
    end
  end
end
