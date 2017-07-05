class WordIndex

	@index = {}

	class << self
		attr_accessor :index

		def get(word)
			unless index[word]
				index[word] = []
			end

			index[word]
		end

		def add(word, mind)
			mind.word = word
			get(word).push(mind)
		end

		def length
			index.length
		end
	end
end