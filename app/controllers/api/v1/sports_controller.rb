class Api
  class V1
    class SportsController < ApplicationController
      def index
        getter = Sports::Get.new
        sports = getter.call

        respond_with json: :sports
      end
    end
  end
end 