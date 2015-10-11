class Api
  class V1
    class SportsController < ApplicationController
      def index
        getter = BetVictor::Sports.new
        sports = getter.call

        respond_with json: :sports
      end
    end
  end
end 