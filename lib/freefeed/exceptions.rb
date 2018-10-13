module Freefeed
  module Exceptions
    class ResponseError < StandardError
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def to_s
        super + format(' (%s)', data.map { |k, v| %(#{k}: "#{v}") }.join(', '))
      end

      private

      def data
        @data ||= begin
          MultiJson.load(response.body)
        rescue MultiJson::DecodeError
          { uri: response.env.url.to_s, errors: response.body.to_s }
        end.merge(code: response.status)
      end
    end
    class WrongEndpoint < StandardError
    end
  end
end
