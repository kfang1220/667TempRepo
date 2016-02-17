require 'socket'

class SimpleClient
  attr_reader :options

  DEFAULT_PORT = 56789

  def initialize(options={})
    @options = options
  end

  def perform_requests(count)
    (1..count).each do |request_number|
      socket = TCPSocket.open('localhost', DEFAULT_PORT)

      puts "Making request ##{request_number}:"
      while line = socket.gets
        puts line.chop
      end

      socket.close
      puts "Closed request ##{request_number}"
    end
  end
end
client = SimpleClient.new()
client.perform_requests(10)