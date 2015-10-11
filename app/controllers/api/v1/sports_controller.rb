class Api
  class V1
    class SportsController < ApplicationController
      def index
        getter = BetVictor::Content.new
        content = getter.call

        respond_with json: :content
      end
    end
  end
end 