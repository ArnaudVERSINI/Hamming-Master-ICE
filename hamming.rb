class Hamming


  def initialize()
    @matrice = [
	[1, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 1, 0],
	[0, 0, 0, 1],
	[1, 1, 0, 1],
	[1, 0, 1, 1],
	[0, 1, 1, 1]]

  @matriceEncodage = [
	0x00,
	0x71,
	0x62,
	0x13,
	0x54,
	0x25,
	0x36,
	0x47,
	0x38,
	0x49,
	0x5A,
	0x2B,
	0x6C,
	0x1D,
	0x0E,
	0x7F]

  end
  
  #Encode une chaine de caractére contenant des 0 et des 1
  def encodeBinStr (strToEncode)
    
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def decodeBinStr (strToDecode)
    
  end

  def encodeUnsignedByte(byteToEncode)
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def encodeQuartet (quartetToEnccode)
	@matriceEncodage[quartetToEnccode]
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def decodeQuartet (quartetToDecode)
    
  end
end

ham = Hamming.new
puts ham

0.upto(15) do | i |
	puts "i donne " + ham.encodeQuartet(i).to_s()
end
