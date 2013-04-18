require 'faraday_middleware'
require 'json'
require 'svpply/products'
require 'svpply/search'

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

    attr_reader :access_token, :client_id

    def initialize(opts)
      @access_token = opts[:access_token]
      @client_id = opts[:client_id]
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
      print res
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