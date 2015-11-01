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
        sports_serializer = SportsSerializer.new data
        sports_serializer.call
      end
    end
  end
end 