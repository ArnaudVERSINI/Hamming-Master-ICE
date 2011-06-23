class Bruit

	attr_accessor  :proba
	@nbMax
	def initialize (proba = 10e5)
		@proba = proba
		
	end
	
	def inserer_bruit(byteToNoise)
	    masque = 1
	    8.times do
			masque = masque << 1
	    	nb = rand(@proba)
	    	if (nb == 1) then
				byteToNoise = masque ^ nb
				puts "On a inséré du bruit"
	    	end
		end
		return byteToNoise
	end
end
