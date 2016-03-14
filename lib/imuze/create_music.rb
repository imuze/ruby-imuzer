module Imuze
  class CreateMusic < Struct.new(:token, :duration, :genre, :subgenre, :structure, :options)
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
      hash = {
        genre: genre,
        subgenre: subgenre,
        duration_ms: duration.to_i,
        structure: music_structure
      }
      hash.merge!(crop: crop) if crop
      hash.merge!(fadeout_ms: fadeout_ms) if fadeout_ms
      hash.merge!(voices_volume: voices_volume) if voices_volume
      hash.to_json
    end

    def crop
      options.nil? ? nil : options[:crop]
    end

    def fadeout_ms
      options.nil? ? nil : options[:fadeout_ms]
    end

    def voices_volume
      options.nil? ? nil : options[:voices_volume]
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
