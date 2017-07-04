require 'date'
require_relative 'GlobalState'

# TODO Remember to do: Dump State after dump AI
class TimeMachine

	def initialize
		@dump_zero_time = DateTime.now
		@cold_dump_zero_time = DateTime.now
	end

	def run
		restore
		cycle
	end

	def restore(date=nil)
		pause_ai_loop

		if date
			target = list[date]
		else
			target = last
		end

		# TODO

		release_ai_loop
	end

	def dump
		pause_ai_loop

		# TODO
		
		release_ai_loop
	end

	def cold(date=nil)
		if date
			targets = [list[date]]
		else
			targets = list.values
		end

		# TODO
	end

	def list
		# TODO
	end

	def last
		# TODO
	end

	def cycle
		[
			dump_thread(:dump, :dump_period,      :in_dump_process,      :@dump_zero_time),
			dump_thread(:cold, :cold_dump_period, :in_cold_dump_process, :@cold_dump_zero_time)
		]
	end

	private

	def pause_ai_loop
		# TODO
	end

	def release_ai_loop
		# TODO
	end

	def renew_global_state(restored)
		restored.instance_variables.each do |sym|
			name = sym.to_s[1..-1]

			GlobalState.send("#{name}=", y.send(name))
		end
	end

	def dump_thread(method_sym, period, process_flag_sym, zero_var_sym)
		Thread.new do
			loop do
				state = GlobalState

				sleep state.dump_check_delay

				if state.shutdown
					break
				end

				if DateTime.now - state.send(period) > @dump_zero_time
					state.send("#{process_flag_sym.to_s}=".to_sym, true)

					send(method_sym)
					instance_variable_set(zero_var_sym, DateTime.now)

					state.send("#{process_flag_sym.to_s}=".to_sym, false)
				end
			end
		end
	end

end