module Errors 
  class Status
    def initialize status
      @status = status
    end

    def default_message
      "Error in the server status: #{status}"
    end

    private

    attr_reader :status
  end
end
