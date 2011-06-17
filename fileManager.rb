# Classe de gestion des fichiers

class FileManager

	attr_accessor  :fileName
	@asciiData
	@binData
	
	def initialize (fileName = "source.txt")
		@fileName= fileName
		@asciiData = []
		@binData= []
	end

	# Ouverture du fichier
	def openFileAndDisplay
		begin
			file = File.new(@fileName, "r")
			while (line = file.gets)
				@asciiData.push(line)
				
			end
			file.close
			
		rescue => err
			puts "Exception: #{err}"
			err
		end
	end
	
	#Ecriture et affichage du fichier
	def writeFileAndDisplay
		File.open("sourcebin.txt", 'w') {|f| f.write(@binData) }
		
		begin
			file = File.new("sourcebin.txt", "r")
			while (line = file.gets)
				puts "#{line}"
			end
			file.close
		rescue => err
			puts "Exception: #{err}"
			err
		end
	end
	
	# Transforme ascii en binaire
	def encodeToBinFromAscii
		# Parcours du tableau ASCII
		
		@asciiData.each do |line|
			compteur = 0 
			line.each_char  do |b| 
				@binData.push(b.unpack('b8*'))				
			end
			
			@binData.push("\n")
			#puts tabChar
			#tabChar.each do |c|
				#compteur = compteur + 1
				#puts "#{compteur} : #{c}"
				#@binData.push(c[0].to_s(2))
			#end
						
			#puts 	@binData	
		end
		writeFileAndDisplay()
	end
	
	def decodeToAsciiFromBin
	
	end
	
end


