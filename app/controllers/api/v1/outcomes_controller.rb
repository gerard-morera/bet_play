module Api
  module V1
    class OutcomesController < ApplicationController
      def index
        binding.pry
        getter   = Outcomes::Get.new outcomes_params, content
        outcomes = getter.call

        render json: outcomes
      end

      private

      def outcomes_params
        OutcomesParams.new params
      end

      def content
        content = BetVictor::Content.new
        content.get
      end
    end
  end
end