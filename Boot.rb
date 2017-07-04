require_relative 'GlobalState'
require_relative 'TimeMachine'
require_relative 'Threads'

class Boot

	def initialize
		puts 'Start...'

		puts 'Start Time Machine...'
		Threads.root_threads += TimeMachine.new.run
		puts 'Ok'

		puts 'Start Control...'
		# TODO
		puts 'Ok'

		puts 'Start AI...'
		# TODO
		puts 'Ok'

		puts 'Started!'

		Threads.root_threads.each(&:join)
	end

end

Boot.new
