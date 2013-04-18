require 'faraday_middleware'
require 'json'
require 'svpply/products'
require 'svpply/search'
require 'svpply/tokens'

module Svpply
  CONNECTION_OPTIONS = {
    headers: {
      accept: 'application/json',
      user_agent: 'svpply-ruby client'
    }
  }

  class Client
    include Svpply::Products
    include Svpply::Search
    include Svpply::Tokens
    attr_reader :access_token, :client_id, :client_secret, :code

    # Initialization can set the access_token, client_id, client_secret, and code here
    # The subset of [client_id, client_set, code] should throw an exception if all are not set
    # since they are needed for token expiration
    def initialize(opts)
      @access_token = opts[:access_token]
      @client_id = opts[:client_id]
      @client_secret = opts[:client_secret]
      @code = opts[:code]
    end

    def get(endpoint, params)
      request(:get, endpoint, params)
    end

    def post(endpoint, params)
      request(:post, endpoint, params)
    end

    def put(endpoint, params)
      request(:put, endpoint, params)
    end

    def delete(endpoint, params)
      request(:delete, endpoint, params)
    end

    def request(action, endpoint, params)
      res = connection.send(action, endpoint, params).env
      if res[:body] && res[:body] != ''
        JSON.parse res[:body]
      else
        {status: res[:status]}
      end
    end

    def connection
      @connection ||= Faraday.new('https://api.svpply.com/v1', CONNECTION_OPTIONS) do |conn|
        conn.adapter Faraday.default_adapter
      end
    end
  end
end