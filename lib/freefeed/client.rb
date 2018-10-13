module Freefeed
  class Client
    HOST = 'freefeed.net'.freeze

    attr_accessor :api_token, :faraday_options, :resources

    def initialize(api_token = nil, faraday_options = {})
      @api_token = api_token
      @faraday_options = faraday_options
    end

    def authenticate(username:, password:)
      res = call!(
        :post, 'https://freefeed.net/v1/session',
        username: username, password: password
      )
      res.tap { |re| @api_token = re.fetch('authToken') }
    end

    def call(endpoint, params = {}, headers = {})
      guard_wrong_endpoint(endpoint)
      call!(
        ENDPOINTS[endpoint][:method], path(endpoint),
        build_options(endpoint, params), headers
      )
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

    def guard_wrong_endpoint(endpoint)
      raise Exceptions::WrongEndpoint unless ENDPOINTS.keys.include?(endpoint)
    end

    def build_options(endpoint, params)
      default_params(endpoint).merge(sanitize_params(endpoint, params))
    end

    def path(endpoint)
      (endpoint.start_with?('/') ? '' : BASE_PATH) + endpoint.split('#').first
    end

    def default_params(endpoint)
      {}.merge(ENDPOINTS[endpoint][:default_params] || {})
    end

    def sanitize_params(endpoint, params)
      return {} unless ENDPOINTS[endpoint][:params]
      params.delete_if do |key, _|
        !ENDPOINTS[endpoint][:params].include?(key.to_s)
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
