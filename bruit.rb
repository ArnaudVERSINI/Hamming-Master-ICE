class Bruit

	attr_accessor  :proba
	@nbMax
	def initialize (proba = 10e5)
		@proba = proba
		
	end
	
	def inserer_bruit(byteToNoise)
	    sav = byteToNoise
	    masque = 1
            bruit = false
	    7.times do
	    	nb = rand(@proba)
	    	if (nb == 1) then
                        if (bruit == true) then
                             puts "Bruit double demandé"
			end
			byteToNoise = masque ^ byteToNoise
			puts "On a inséré du bruit " + byteToNoise.to_s(2) + "," + sav.to_s(2)
                        bruit = true
	    	end
            masque = masque << 1
	    end
		return byteToNoise
	end
end
