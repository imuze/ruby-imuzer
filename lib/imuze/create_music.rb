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
        structure:music_structure
      }.to_json
    end

    def music_structure
      array = []
      time = 0.0
      structure.split(',').each do |mov|
        type, duration = mov.split(':')
        hash = {
          energy: type,
          start: time.to_f,
          duration: duration.to_f
        }
        array << hash
        time += duration.to_f
      end
      array
    end
  end
end
