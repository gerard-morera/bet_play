module Api
  module V1
    class SportsController < ApplicationController
      def index
        getter = Sports::Get.new content
        sports = getter.call 

        render json: serializer(sports)
      end

      private 
      
      def content
        content = BetVictor::Content.new
        content.get
      end

      def serializer data
        serializer = SportSerializer.new data
        serializer.call
      end
    end
  end
end 

# rescue from mirar