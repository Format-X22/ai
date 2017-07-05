class MindIndex

	@index = []

	class << self
		attr_accessor :index

		def add(mind)
			mind.id = length
			index.push(mind)
		end

		def length
			index.length
		end
	end
end