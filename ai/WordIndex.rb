class WordIndex

	@index = {}

	class << self
		attr_accessor :index

		def get(name)
			unless index[name]
				index[name] = []
			end

			index[name]
		end

		def push(name, mind)
			get(name) << mind
		end

		def length
			index.length
		end
	end
end