module Svpply
  module Tokens
    # If the client_id, client_secret, and code are set, get the next access_token for the user
    # and set it on the client object
    def get_token
      connection ||= Faraday.new('https://svpply.com/oauth', CONNECTION_OPTIONS) do |conn|
        conn.adapter Faraday.default_adapter
      end

      access_token = connection.send('get', 'access_token', {
        client_id: client_id,
        client_secret: client_secret,
        code: code
      })

      @access_token = access_token
    end
  end
end