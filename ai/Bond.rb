class Bond

	def initialize(a_mind, b_mind, link = 0, group = 0, identity = 0)
		@a_mind = a_mind
		@b_mind = b_mind
		@link = link
		@group = group
		@identity = identity
	end

	def link(inc = nil)
		if inc
			@link += inc
		else
			@link
		end
	end

	def group(mind, inc = nil)
		if inc
			if mind == @a_mind
				@group += inc
			else
				@group -= inc
			end
		else
			if mind == @a_mind
				@group
			else
				-@group
			end
		end
	end

	def identity(inc = nil)
		if inc
			@identity += inc
		else
			@identity
		end
	end

	def bonded(mind)
		if mind == @a_mind
			@b_mind
		else
			@a_mind
		end
	end

end