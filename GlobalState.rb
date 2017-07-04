require 'active_support/core_ext/numeric/time'

class GlobalState

	@shutdown = false

	# Dump
	@dump_period      = 6.hours
	@dump_check_delay = 10.seconds
	@cold_dump_period = 1.day
	@dump_count_fresh = 0 # TODO
	@dump_count_olden = 0 # TODO
	@dump_count_epoch = 0 # TODO

	@in_dump_process      = false
	@in_cold_dump_process = false

	# Get/Set magic
	@@iv = instance_variables
	class << self
		attr_accessor(*@@iv.map {|var| var.to_s[1..-1].to_sym})
	end
end