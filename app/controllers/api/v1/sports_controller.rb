class Api
  class V1
    class SportsController < ApplicationController
      def index
        filter = Filters::Sports.new sports_params
        sports = filter.call

        respond_with json: :sports
      end

      def sports_params
        content = BetVictor::Content.new
        content.call
      end
    end
  end
end 