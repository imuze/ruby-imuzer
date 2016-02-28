module Imuze
  class GetMusic < Struct.new(:token, :mp3_uri)
    include Methadone::CLILogging
    include Methadone::SH
    require 'uri'
    require 'net/http'
    require 'json'

    def self.call(*args)
      new(*args).call
    end

    def call
      sh command do |stdout, stderr|
        puts 'We hope you liked it !'
      end
    end

    private

    def command
      %Q(curl "http:#{mp3_uri}"  -s -H "Content-Type: application/json"  -H "Authorization: #{token}" | mpg123 - 2> /dev/null)    end
  end
end
