class FormatResponse < Struct.new(:response, :options)

  def self.call(*args)
    new(*args).call
  end

  def call
    formated_json = JSON.pretty_generate(response)
    if response['status'] == 500 || response['status'] == 403
      puts Rainbow(formated_json).red
      exit
    else
      puts Rainbow(formated_json).green if options[:verbose]
    end
  end
end
