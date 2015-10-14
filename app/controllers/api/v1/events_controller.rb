module Api
  module V1
    class EventsController < ApplicationController
      def index
        getter = Events::Get.new(events_params, content)
        events = getter.call

        render json: events
      end

      private 

      def events_params
        EventsParams.new params
      end

      def content
        content = BetVictor::Content.new
        content.call
      end
    end
  end
end