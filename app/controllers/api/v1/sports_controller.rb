module Api
  module V1
    class SportsController < ApplicationController

      def index
        getter = Sports::Get.new sports_params
        sports = getter.call

        render json: sports
      end

      private 
      
      def sports_params
        content = BetVictor::Content.new
        content.get
      end
    end
  end
end 