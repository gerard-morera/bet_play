module Api
  module V1
    class SportsController < ApplicationController

      def index
        getter = Sports::Get.new parsed_content
        sports = getter.call

        render json: sports
      end

      private 

      def parsed_content
        parse content 
      end
      
      def content
        content = BetVictor::Content.new
        content.get
      end

      def parse content
        parser = Parsers::JsonToRuby.new content
        parser.call
      end
    end
  end
end 