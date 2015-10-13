module Api
  module V1
    class EventsController < ApplicationController
      def index
        getter = Events::Get.new(events_params, parse(content))
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

      def parse args
        parser = Parsers::JsonToRuby.new args
        parser.call
      end
    end
  end
end