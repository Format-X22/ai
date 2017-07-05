class MindIndex

	@index = []

	class << self
		attr_accessor :index

		def push(val)
			index << val
		end

		def length
			index.length
		end
	end
end