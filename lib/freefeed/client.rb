module Freefeed
  class Client
    HOST = 'freefeed.net'.freeze

    attr_accessor :api_token, :faraday_options, :resources

    def initialize(api_token = nil, faraday_options = {})
      @api_token = api_token
      @faraday_options = faraday_options
    end

    def authenticate(username:, password:)
      Session.create(self, username: username, password: password).tap do |re|
        @api_token = re.fetch('authToken')
      end
    end

    def call!(verb, endpoint, params = {}, headers = {})
      response = conn.send(
        verb, endpoint, params, auth_header.merge(headers)
      )
      handle_erros(response)
      prepare_response(response)
    end

    private

    def conn
      @conn ||= Faraday.new(url: "https://#{HOST}") do |faraday|
        faraday.request :multipart
        faraday.response(
          :logger,
          (faraday_options[:logger] || Logger.new(STDOUT)),
          (faraday_options[:logger_options] || { bodies: true, headers: true })
        )
        faraday.request :json
        faraday.adapter faraday_options[:adapter] || Faraday.default_adapter
      end
    end

    def handle_erros(response)
      raise(
        Exceptions::ResponseError.new(response),
        'Freefeed API has returned the error'
      ) unless response.status == 200
    end

    def prepare_response(response)
      MultiJson.load(response.body.to_s)
    rescue MultiJson::LoadError
      response.body
    end

    def auth_header
      api_token.nil? ? {} : { 'x-authentication-token': api_token }
    end
  end
end
