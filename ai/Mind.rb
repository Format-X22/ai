require_relative 'Bond'

class Mind
	attr_accessor :id, :word

	def initialize
		@id = nil
		@word = nil
		@bonds = {}
	end

	def update(mind, link_inc, group_inc, identity_inc)
		link(mind, link_inc)
		group(mind, group_inc)
		identity(mind, identity_inc)
	end

	def link(mind, inc)
		bond(mind).link(inc)
	end

	def group(mind, inc)
		bond(mind).group(mind, inc)
	end

	def identity(mind, inc)
		bond(mind).identity(inc)
	end

	def bond_list
		@bonds.keys
	end

	def bond(mind)
		unless @bonds[mind]
			@bonds[mind] = Bond.new(mind, self)
			mind.connect(self, @bonds[mind])
		end

		@bonds[mind]
	end

	def connect(mind, bond)
		@bonds[mind] = bond
	end

end