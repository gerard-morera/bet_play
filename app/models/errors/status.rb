module Errors 
  class Status
    def initialize status
      @status = status
    end

    def default_message
      "Status #{status}. Error in the server."
    end

    private

    attr_reader :status
  end
end
