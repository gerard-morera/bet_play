module Api
  module V1
    class OutcomesController < ApplicationController
      def index
        getter   = Outcomes::Get.new outcomes_params, content
        outcomes = getter.call
        
        render json: serializer(outcomes)
      end

      private

      def outcomes_params
        OutcomesParams.new params
      end

      def content
        content = BetVictor::Content.new
        content.get
      end

      def serializer outcomes
        outcomes_serializer = OutcomesSerializer.new outcomes
        outcomes_serializer.call
      end
    end
  end
end