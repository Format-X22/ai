class Threads

	@root_threads = []
	@ai_threads = []

	# Get/Set magic
	@@iv = instance_variables
	class << self
		attr_accessor(*@@iv.map {|var| var.to_s[1..-1].to_sym})
	end
end