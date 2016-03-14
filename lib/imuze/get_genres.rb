module Imuze
  class GetGenres < Struct.new(:global_options)
    require 'uri'
    require 'net/http'
    require 'json'

    def self.call(*args)
      new(*args).call
    end

    def call
      response = http.request(get_request)
      JSON.parse(response.read_body)
    end

    private

    def url
      @url ||= URI('http://joplin.imuze.io/genres')
    end

    def http
      @http ||= Net::HTTP.new(url.host, url.port)
    end

    def get_request
      request = Net::HTTP::Get.new(url)
      request['content-type'] = 'application/json'
      request['cache-control'] = 'no-cache'
      request
    end
  end
end
