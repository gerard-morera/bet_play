module Api
  module V1
    class SportsController < ApplicationController

      def index
        getter = Sports::Get.new(parse(content))
        sports = getter.call

        render json: sports
      end

      private 
      
      def content
        content = BetVictor::Content.new
        content.get
      end

      def parse args
        parser = Parsers::JsonToRuby.new args
        parser.call
      end
    end
  end
end 