class FileManager

	attr_accessor  :fileName
	
	def initialize (fileName = "source.txt")
    @fileName= fileName
	end

	# Ouverture du fichier
	def openFile
		counter = 1
		begin
			file = File.new(@fileName, "r")
			while (line = file.gets)
				puts "#{line}"
				counter = counter + 1
			end
			file.close
		rescue => err
			puts "Exception: #{err}"
			err
		end
	end
end

file = FileManager.new
puts file.fileName();
file.openFile();

