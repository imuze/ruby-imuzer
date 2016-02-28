module Imuze
  class CreateToken < Struct.new(:email, :password)
    require 'uri'
    require 'net/http'
    require 'json'

    def self.call(*args)
      new(*args).call
    end

    def call
      response = http.request(put_request)
      JSON.parse(response.read_body)
    end

    private

    def url
      @url ||= URI('http://joplin.imuze.io/accounts/token')
    end

    def http
      @http ||= Net::HTTP.new(url.host, url.port)
    end

    def put_request
      request = Net::HTTP::Put.new(url)
      request['content-type'] = 'application/json'
      request['cache-control'] = 'no-cache'
      request.body = request_body
      request
    end

    def request_body
      {
        email: email,
        password: password
      }.to_json
    end
  end
end
