module Api
  module V1
    class OutcomesController < ApplicationController
      def index
        getter   = Outcomes::Get.new outcomes_params, content
        outcomes = getter.call

        render json: outcomes
      end

      private

      def outcomes_params
        Params::OutcomesParams.new params
      end

      def content
        content = BetVictor::Content.new
        content.call
      end
    end
  end
end