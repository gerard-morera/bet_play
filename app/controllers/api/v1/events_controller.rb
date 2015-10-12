module Api
  module V1
    class EventsController < ApplicationController
      def index
        getter = Events::Get.new events_params
        events = getter.call

        render json: events
      end

      private 

      def events_params
        EventsParams.new params
      end
    end
  end
end