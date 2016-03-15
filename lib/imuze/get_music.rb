module Imuze
  class GetMusic < Struct.new(:token, :mp3_uri, :options)
    include Methadone::CLILogging
    include Methadone::SH
    require 'uri'
    require 'net/http'
    require 'json'

    def self.call(*args)
      new(*args).call
    end

    def call
      download? ? command_download : command_play
    end

    private

    def command_play
      command = %Q(curl "http:#{mp3_uri}"  -s -H "Content-Type: application/json"  -H "Authorization: #{token}" | mpg123 - 2> /dev/null)
      sh command do |stdout, stderr|
        puts 'We hope you liked it !'
      end
    end

    def command_download
      command = %Q(wget "http:#{mp3_uri}" -O #{mp3_id}.mp3 --header "Authorization: #{token}")
      sh command do |stdout, stderr|
        puts 'We hope you liked it !'
      end
    end

    def download?
      options.nil? ? false : options[:download]
    end

    def mp3_id
      mp3_uri.split('/')[4]
    end
  end
end
