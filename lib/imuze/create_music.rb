module Imuze
  class CreateMusic < Struct.new(:token, :duration, :genre, :subgenre, :structure)
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
      @url ||= URI('http://joplin.imuze.io/musics')
    end

    def http
      @http ||= Net::HTTP.new(url.host, url.port)
    end

    def put_request
      request = Net::HTTP::Post.new(url)
      request['content-type'] = 'application/json'
      request['authorization'] = token
      request['cache-control'] = 'no-cache'
      request.body = request_body
      request
    end

    def request_body
      {
        genre: genre,
        subgenre: subgenre,
        duration_ms: duration.to_i,
        structure:[
          {
              energy: "calm",
              start:0,
              duration:0.33
          },
          {
              energy:"medium",
              start:0.33,
              duration:0.33
          },
          {
              energy:"dynamic",
              start:0.66,
              duration:0.33
          }
        ]
      }.to_json
    end
  end
end
