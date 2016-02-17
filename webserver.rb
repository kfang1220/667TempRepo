require 'socket'


class Webserver
  attr_reader :options
  DEFAULT_PORT = 56789
  def initialize(options={})
  @options = options
	end
	def start
    loop do 
		  puts "Opening Webserver..."
			socket = server.accept

			 # Just to make the responses a little different...
			puts "Received connection, waiting for one second"
			sleep(1)

			puts "Writing message"
			socket.puts "The current time is #{Time.now}"

		  socket.close
		end
	end

	def server
	@server ||= TCPServer.open(options.fetch(:port, DEFAULT_PORT))
  end

end
server = Webserver.new()
server.start