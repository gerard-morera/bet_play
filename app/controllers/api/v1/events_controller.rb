module Api
  module V1
    class EventsController < ApplicationController
      def index
        getter = Events::Get.new(events_params, content)
        events = getter.call

        render json: serializer(events)
      end

      private 

      def events_params
        EventsParams.new params
      end

      def content
        content = BetVictor::Content.new
        content.get
      end

      def serializer events
        events_serializer = EventsSerializer.new events
        events_serializer.call
      end
    end
  end
end